---Copy of the Weakaura helper code, this file isn't loaded in the addon.
--The weakaura helper just sends some character data like resistances etc to people with the addon during raid.
--So if people don't want the addon the raid leader can still share the wekaura to see raid wide character data.
--This whole file is just pasted in to the weakaura On Init action.

aura_env.NRCAH = {};
local NRCAH = aura_env.NRCAH;

NRCAH.expansionNum = 1;
if (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC) then
	NRCAH.isClassic = true;
elseif (WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC) then
	NRCAH.isTBC = true;
	NRCAH.expansionNum = 2;
elseif (WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC) then
	NRCAH.isWrath = true;
	NRCAH.expansionNum = 3;
elseif (WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC) then
	NRCAH.isCata = true;
	NRCAH.expansionNum = 4;
end
if (NRCAH.isClassic and C_Engraving and C_Engraving.IsEngravingEnabled()) then
	NRCAH.isSOD = true;
end

NRCAH_Installed = true;
NRCAH.version = 1.06;
--All these libs are already included with weakauras.
NRCAH.comms = LibStub:GetLibrary("AceComm-3.0");
NRCAH.comms:Embed(NRCAH);
NRCAH.libDeflate = LibStub:GetLibrary("LibDeflate");
NRCAH.serializer = LibStub:GetLibrary("LibSerialize");
NRCAH.lastGroupJoin = 0;
NRCAH.lastRaidDataSent = 0;
NRCAH.id = aura_env.id;

--It is highly discouraged to create a db in this way unless you really know what you're doing.
--Database is also shared when you give WAs to other people.
--This is now disabled, WA devs removed access to WeakAurasSaved.
--No clean way to check version or if first load now so we just have to do things every load.
--[[if (not WeakAurasSaved.displays[aura_env.id].database) then
    WeakAurasSaved.displays[aura_env.id].database = {};
end
if (not WeakAurasSaved.displays[aura_env.id].database) then
    WeakAurasSaved.displays[aura_env.id].database = {};
end
NRCAH.db = WeakAurasSaved.displays[aura_env.id].database;
if (not NRCAH.db.lastVersionMsg) then
    NRCAH.db.lastVersionMsg = 0;
end]]

if (not aura_env.saved) then
    aura_env.saved = {};
end
NRCAH.db = aura_env.saved;
if (not NRCAH.db.lastVersionMsg) then
    NRCAH.db.lastVersionMsg = 0;
end

--Do nothing further if NRC is installed, it does the sharing itself.
if (NRC_Installed) then
	 NRCAH_Halted = true;
	--If it is installed still listen for version updates though.
	function NRCAH:OnCommReceived(commPrefix, string, distribution, sender)
	    if ((distribution ~= "RAID" and distribution ~= "PARTY") or UnitInBattleground("player")) then
	        return;
	    end
	    local me = UnitName("player") .. "-" .. GetRealmName();
	    local meNormalized = UnitName("player") .. "-" .. GetNormalizedRealmName();
	    if (sender == UnitName("player") or sender == me or sender == meNormalized) then
	        return;
	    end
	    local _, realm = strsplit("-", sender, 2);
	    if (not string.match(sender, "-")) then
	        sender = sender .. "-" .. GetNormalizedRealmName();
	    end
	    local decoded;
	    if (distribution == "YELL" or distribution == "SAY") then
	        decoded = NRCAH.libDeflate:DecodeForWoWChatChannel(string);
	    else
	        decoded = NRCAH.libDeflate:DecodeForWoWAddonChannel(string);
	    end
	    if (not decoded) then
	        return;
	    end
	    local decompressed = NRCAH.libDeflate:DecompressDeflate(decoded);
	    local deserializeResult, deserialized = NRCAH.serializer:Deserialize(decompressed);
	    if (not deserializeResult) then
	        return;
	    end
	    local cmd, remoteVersion, data = strsplit(" ", deserialized, 3);
	    if (NRCAH.db.lastVersionMsg and tonumber(remoteVersion) > tonumber(NRCAH.version) and (GetServerTime() - NRCAH.db.lastVersionMsg) > 604800) then
	        print("|cFFFFFF00Nova Raid Companion |cFF00FF00Addon Helper Weakaura|r is out of date, please update it at https://wago.io/sof4ehBA6.");
	        NRCAH.db.lastVersionMsg = GetServerTime();
	    end
	end
	if (not aura_env.commRegistered) then
	    NRCAH:RegisterComm("NRCAH");
	end
	aura_env.commRegistered = true;
    return;
end

function NRCAH:OnCommReceived(commPrefix, string, distribution, sender)
    if (commPrefix == "NRCAH") then
        NRCAH:OnHelperCommReceived(commPrefix, string, distribution, sender);
        return;
    end
    if ((distribution ~= "RAID" and distribution ~= "PARTY") or UnitInBattleground("player")) then
        return;
    end
    --AceComm doesn't supply realm name if it's on the same realm as player.
    --Not sure if it provides GetRealmName() or GetNormalizedRealmName() for crossrealm.
    --For now we'll check all 3 name types just to be sure.
    local me = UnitName("player") .. "-" .. GetRealmName();
    local meNormalized = UnitName("player") .. "-" .. GetNormalizedRealmName();
    if (sender == UnitName("player") or sender == me or sender == meNormalized) then
        return;
    end
    --If no realm in name it must be our realm so add it.
    if (not string.match(sender, "-")) then
        sender = sender .. "-" .. GetRealmName();
    end
    local decoded;
    if (distribution == "YELL" or distribution == "SAY") then
        decoded = NRCAH.libDeflate:DecodeForWoWChatChannel(string);
    else
        decoded = NRCAH.libDeflate:DecodeForWoWAddonChannel(string);
    end
    if (not decoded) then
        return;
    end
    local decompressed = NRCAH.libDeflate:DecompressDeflate(decoded);
    local deserializeResult, deserialized = NRCAH.serializer:Deserialize(decompressed);
    if (not deserializeResult) then
        return;
    end
    local cmd, remoteVersion, data = strsplit(" ", deserialized, 3);
    if (cmd == "requestRaidData") then
        NRCAH:sendRaidData();
    end
end

if (not aura_env.commRegistered) then
    NRCAH:RegisterComm("NRC");
    NRCAH:RegisterComm("NRCAH");
end
aura_env.commRegistered = true;

function NRCAH:OnHelperCommReceived(commPrefix, string, distribution, sender)
    if ((distribution ~= "RAID" and distribution ~= "PARTY") or UnitInBattleground("player")) then
        return;
    end
    local me = UnitName("player") .. "-" .. GetRealmName();
    local meNormalized = UnitName("player") .. "-" .. GetNormalizedRealmName();
    if (sender == UnitName("player") or sender == me or sender == meNormalized) then
        return;
    end
    local _, realm = strsplit("-", sender, 2);
    if (not string.match(sender, "-")) then
        sender = sender .. "-" .. GetNormalizedRealmName();
    end
    local decoded;
    if (distribution == "YELL" or distribution == "SAY") then
        decoded = NRCAH.libDeflate:DecodeForWoWChatChannel(string);
    else
        decoded = NRCAH.libDeflate:DecodeForWoWAddonChannel(string);
    end
    if (not decoded) then
        return;
    end
    local decompressed = NRCAH.libDeflate:DecompressDeflate(decoded);
    local deserializeResult, deserialized = NRCAH.serializer:Deserialize(decompressed);
    if (not deserializeResult) then
        return;
    end
    local cmd, remoteVersion, data = strsplit(" ", deserialized, 3);
    if (NRCAH.db.lastVersionMsg and tonumber(remoteVersion) > tonumber(NRCAH.version) and (GetServerTime() - NRCAH.db.lastVersionMsg) > 604800) then
        print("|cFFFFFF00Nova Raid Companion |cFF00FF00Addon Helper Weakaura|r is out of date, please update it at https://wago.io/sof4ehBA6.");
        NRCAH.db.lastVersionMsg = GetServerTime();
    end
end

function NRCAH:sendComm(distribution, string, target)
    if (target == UnitName("player") or UnitInBattleground("player")) then
        return;
    end
    if (distribution == "GUILD" and not IsInGuild()) then
        return;
    end
    local data;
    local serialized = NRCAH.serializer:Serialize(string);
    local compressed = NRCAH.libDeflate:CompressDeflate(serialized, {level = 9});
    if (distribution == "YELL" or distribution == "SAY") then
        data = NRCAH.libDeflate:EncodeForWoWChatChannel(compressed);
    else
        data = NRCAH.libDeflate:EncodeForWoWAddonChannel(compressed);
    end
    NRCAH:SendCommMessage("NRCAH", data, distribution, target);
end

local function sendGroupComm(msg)
	if (IsInRaid()) then
		NRCAH:sendComm("RAID", msg);
	elseif (LE_PARTY_CATEGORY_INSTANCE and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
        NRCAH:sendComm("INSTANCE_CHAT", msg);
	elseif (IsInGroup()) then
		NRCAH:sendComm("PARTY", msg);
	end
end

NRCAH.currentThroddles = {};
function NRCAH:throddleEventByFunc(event, time, func, ...)
    if (NRCAH.currentThroddles[func] == nil) then
        --Must be false and not nil.
        NRCAH.currentThroddles[func] = ... or false;
        C_Timer.After(time, function()
                self[func](self, NRCAH.currentThroddles[func]);
                NRCAH.currentThroddles[func] = nil;
        end)
    end
end

local myRes = {};
local myEnchants;
local f = CreateFrame("Frame");
f:RegisterEvent("GROUP_FORMED");
f:RegisterEvent("GROUP_JOINED");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:RegisterEvent("UNIT_INVENTORY_CHANGED");
if (C_EventUtils and C_EventUtils.IsEventValid("UNIT_RESISTANCES")) then
	f:RegisterEvent("UNIT_RESISTANCES");
end
if (C_EventUtils and C_EventUtils.IsEventValid("CHARACTER_POINTS_CHANGED")) then
	f:RegisterEvent("CHARACTER_POINTS_CHANGED");
end
if (C_EventUtils and C_EventUtils.IsEventValid("PLAYER_TALENT_UPDATE")) then
	f:RegisterEvent("PLAYER_TALENT_UPDATE");
end
if (NRCAH.expansionNum > 2) then
	f:RegisterEvent("GLYPH_ADDED");
	f:RegisterEvent("GLYPH_UPDATED");
	f:RegisterEvent("GLYPH_REMOVED");
end
f:SetScript('OnEvent', function(self, event, ...)
        if (event == "GROUP_JOINED" or event == "GROUP_FORMED") then
            --We need a cooldown check if we're first to be invited to a group.
            --Both events fire at once for first invited and we only want to send once.
            if (GetNumGroupMembers() > 1 and GetTime() - NRCAH.lastGroupJoin > 1) then
                NRCAH.lastGroupJoin = GetTime();
                NRCAH:sendRaidData();
            end
        elseif (event == "PLAYER_ENTERING_WORLD") then
            NRCAH:checkMyRes(true);
            NRCAH:checkMyEnchants(true);
            --NRCAH.checkMyTalents();
            local isLogon, isReload = ...;
            if (isReload) then
                --If reload then group join won't fire so send it here instead.
                NRCAH:sendRaidData();
            end
            f:UnregisterEvent("PLAYER_ENTERING_WORLD");
        elseif (event == "PLAYER_REGEN_ENABLED") then
            NRCAH:checkMyRes();
            f:UnregisterEvent("PLAYER_REGEN_ENABLED");
        elseif (event == "UNIT_RESISTANCES") then
            local unit = ...;
            if (unit == "player") then
                NRCAH:throddleEventByFunc("UNIT_RESISTANCES", 3, "checkMyRes");
            end
        elseif (event == "UNIT_INVENTORY_CHANGED") then
            NRCAH:throddleEventByFunc("UNIT_INVENTORY_CHANGED", 3, "checkMyEnchants");
        elseif (event == "CHARACTER_POINTS_CHANGED") then
            NRCAH:throddleEventByFunc("CHARACTER_POINTS_CHANGED", 10, "sendTalents");
        elseif (event == "PLAYER_TALENT_UPDATE") then
            NRCAH:throddleEventByFunc("CHARACTER_POINTS_CHANGED", 2, "sendTalents");
        elseif (event == "GLYPH_ADDED" or event == "GLYPH_UPDATED" or event == "GLYPH_REMOVED") then
            NRCAH:throddleEventByFunc("GLYPH_UPDATED", 5, "sendGlyphs");
        end
end)

function NRCAH:sendRes()
    if (not IsInGroup()) then
        return;
    end
    local data = NRCAH.serializer:Serialize(myRes);
    sendGroupComm("res " .. NRCAH.version .. " " .. data);
end

function NRCAH:checkMyRes(setDataOnly)
    if (InCombatLockdown() and not setDataOnly) then
        --Don't clog up comms during combat, wait till combat ends then update others.
        f:RegisterEvent("PLAYER_REGEN_ENABLED");
        return;
    end
    local temp = {};
    for i = 2, 6 do
        --0 = Armor, 1 = Holy, 2 = Fire, 3 = Nature, 4 = Frost, 5 = Shadow, 6 = Arcane,
        local _, total = UnitResistance("player", i);
        temp[i] = total;
    end
    if (setDataOnly) then
        --Just set our data, no sharing.
        myRes = temp;
        return;
    end
    if (not next(myRes)) then
        --First run after logon, create cache and send data if we're in a group.
        myRes = temp;
        if (IsInGroup()) then
            NRCAH:sendRes();
        end
        return;
    end
    --There is no easy table compare in lua.
    if (myRes[2] ~= temp[2] or myRes[3] ~= temp[3]
        or myRes[4] ~= temp[4] or myRes[5] ~= temp[5] or myRes[6] ~= temp[6]) then
        --Resistances have changed, swapped items or received buff.
        myRes = temp;
        NRCAH:sendRes();
    else
        myRes = temp;
    end
end

function NRCAH:sendEnchants()
    if (not IsInGroup()) then
        return;
    end
    local data = NRCAH.serializer:Serialize(myEnchants);
    sendGroupComm("ench " .. NRCAH.version .. " " .. data);
end

local enchantIgnoreList = {
	--Windfury totem.
	[1783] = true,
	[563] = true,
	[564] = true,
	[2638] = true,
	[2639] = true,
	--Wild strikes SoD.
	[6858] = true,
	[7141] = true,
};

function NRCAH:checkMyEnchants(setDataOnly)
    local me = UnitName("player");
    local temp = {};
    local mh, mhTime, _, mhID, oh, ohTime, _, ohID = GetWeaponEnchantInfo();
    if (mh) then
        --Ignore windfury totems.
        if (not enchantIgnoreList[mhID]) then
            temp[1] = mhID;
            temp[2] = GetServerTime() + math.floor(mhTime/1000);
        end
    end
    if (oh) then
        if (not enchantIgnoreList[ohID]) then
            temp[3] = ohID;
            temp[4] = GetServerTime() + math.floor(ohTime/1000);
        end
    end
    if (setDataOnly) then
        --Just set our data, no sharing.
        myEnchants = temp;
        return;
    end
    if (not myEnchants) then
        --First run after logon, create cache and send data if we're in a group.
        myEnchants = temp;
        if (IsInGroup()) then
            NRCAH:sendEnchants();
        end
        return;
    end
    --Only check if enchanted or not, not time left.
    if (myEnchants[1] ~= temp[1] or myEnchants[3] ~= temp[3]) then
        --Weapon enchants have changed..
        myEnchants = temp;
        NRCAH:sendEnchants();
    else
        myEnchants = temp;
    end
end

function NRCAH:sendTalents()
    if (not IsInGroup()) then
        return;
    end
    local talents = NRCAH:createTalentString();
    local data = NRCAH.serializer:Serialize(talents);
   sendGroupComm("tal " .. NRCAH.version .. " " .. data);
end

function NRCAH:sendGlyphs()
    if (not IsInGroup() or NRCAH.expansionNum < 3) then
        return;
    end
    local glyphs = NRCAH:createGlyphString();
    local data = NRCAH.serializer:Serialize(glyphs);
    sendGroupComm("gly " .. NRCAH.version .. " " .. data);
end

--In wrath GetTalentInfo() is no longer sorted by index by instead random, so we need to sort it when creating strings.
--So we need to feed this a talent table and sort it for we can create our in order talent string.
function NRCAH:createTalentStringFromTable(data)
	--Example talent data.
	--[[data = {
		classID = 1,
		[1] = { --Trees.
			[1] = {	--Data as gotten by GetTalentInfo(tree, 1), not in index order anymore for wrath.
				rank = 5,
				row = 2,
				column = 4,
			}
		}
		[2] = {
		[3] = {
	}]]
	--Sort by row and column.
	for k, v in ipairs(data) do
		table.sort(v, function(a, b)
			if (a.row == b.row) then
				return a.column < b.column;
			else
				return a.row < b.row;
			end
		end)
	end
	local talentString = tostring(data.classID);
	local hasTalentData;
	for treeID, treeData in ipairs(data) do
		hasTalentData = true;
		local found;
		local treeString = "";
		for talentID, talentData in ipairs(treeData) do
			treeString = treeString .. talentData.rank;
			if (talentData.rank > 0) then
				found = true;
			end
		end
		treeString = strmatch(treeString, "^(%d-)0*$");
		if (found) then
			talentString = talentString .. "-" .. treeString;
		else
			talentString = talentString .. "-0";
		end
	end
	if (not hasTalentData) then
		return talentString .. "-0-0-0"
	else
		return talentString;
	end
end

function NRCAH:createTalentString()
	if (NRCAH.isRetail) then
		local talentString = "0-0-0";
		return talentString;
	else
		local _, _, classID = UnitClass("player");
		local talentString = tostring(classID);
		--Seems all 3 clients are using the new out of order system now.
		--if (NRC.isWrath or NRC.isTBC or NRC.isClassic) then
			local data = {
				classID = classID,
			};
			for tab = 1, GetNumTalentTabs() do
				data[tab] = {};
				for i = 1, GetNumTalents(tab) do
					local name, _, row, column, rank = GetTalentInfo(tab, i);
					if (name) then
						data[tab][i] = {
							rank = rank,
							row = row,
							column = column,
						};
					else
						break;
					end
				end
			end
			talentString = NRCAH:createTalentStringFromTable(data);
		--[[else
			for tab = 1, GetNumTalentTabs() do
				local found;
				local treeString = "";
				for i = 1, GetNumTalents(tab) do
					local name, _, _, _, rank = GetTalentInfo(tab, i);
					treeString = treeString .. rank;
					if (rank and rank > 0) then
						found = true;
					end
				end
				treeString = strmatch(treeString, "^(%d-)0*$");
				if (found) then
					talentString = talentString .. "-" .. treeString;
				else
					talentString = talentString .. "-0";
				end
			end
		end]]
		return talentString;
	end
end

--First 3 major, second 3 minor.
function NRCAH:createGlyphString(f)
	if (NRCAH.expansionNum < 3) then
		return;
	end
    local _, _, classID = UnitClass("player");
    local glyphString, glyphString2 = classID, classID;
    local activeSpec = GetActiveTalentGroup();
    local offSpec = (activeSpec == 1 and 2 or 1);
    local temp = {};
    local count = 0;
    ---Active spec.
    for i = 1, GetNumGlyphSockets() do
        local enabled, type, spellID, icon = GetGlyphSocketInfo(i, activeSpec);
        if (type == 1) then
            count = count + 1;
            temp[count] = spellID or 0;
        end
    end
    table.sort(temp, function(a, b) return a > b end);
    --Make sure filled slots are first.
    for i = 1, 3 do
        glyphString = glyphString .. "-" .. (temp[i] or 0);
    end
    temp = {};
    count = 0;
    for i = 1, GetNumGlyphSockets() do
        local enabled, type, spellID, texture = GetGlyphSocketInfo(i, activeSpec);
        if (type == 2) then
            count = count + 1;
            temp[count] = spellID or 0;
        end
    end
    table.sort(temp, function(a, b) return a > b end);
    for i = 1, 3 do
        glyphString = glyphString .. "-" .. (temp[i] or 0);
    end
    ---Offspec.
    temp = {};
    count = 0;
    --Active spec.
    for i = 1, GetNumGlyphSockets() do
        local enabled, type, spellID, icon = GetGlyphSocketInfo(i, offSpec);
        if (type == 1) then
            count = count + 1;
            temp[count] = spellID or 0;
        end
    end
    table.sort(temp, function(a, b) return a > b end);
    --Make sure filled slots are first.
    for i = 1, 3 do
        glyphString2 = glyphString2 .. "-" .. (temp[i] or 0);
    end
    temp = {};
    count = 0;
    for i = 1, GetNumGlyphSockets() do
        local enabled, type, spellID, texture = GetGlyphSocketInfo(i, offSpec);
        if (type == 2) then
            count = count + 1;
            temp[count] = spellID or 0;
        end
    end
    table.sort(temp, function(a, b) return a > b end);
    for i = 1, 3 do
        glyphString2 = glyphString2 .. "-" .. (temp[i] or 0);
    end
    --We're only using current spec glyph string atm, probably add dual spec support later.
    --glyphString2 isn't used by any funcs yet.
    --Glyph data can't be inspected and only gets sent others with the addon so mainspec will always be sent.
    --Mainspec glyphs should always be updated by others with the addon so inspecting main spec should always be in sync.
    --On the inspect frame we only display glyphs for main spec.
    return glyphString, glyphString2;
end

--function NRCAH:checkMyTalents()
--No need to check in the WA, we only check in addon for NRC cache.
--end

function NRCAH:sendRaidData()
    if (not IsInGroup()) then
        return;
    end
    if (GetServerTime() - NRCAH.lastRaidDataSent < 30) then --Change this time to longer later (once data accuracy is observed properly).
        --If multiple leaders open the status frame we don't need to keep sending data.
        --They should already have it unless they just joined group.
        --Individual stats are sent when they change so data should always be up to date.
        return;
    end
    NRCAH.lastRaidDataSent = GetServerTime();
    NRCAH:checkMyRes(true);
    NRCAH:checkMyEnchants(true);
    --NRCAH:checkMyTalents();
    local a = {};
    if (myRes) then
        a.a = myRes;
    end
    local b = NRCAH:createTalentString();
    if (b) then
        a.b = b;
    end
    local c;
    if (myEnchants and next(myEnchants)) then
        a.c = myEnchants;
    end
    if (NRCAH.expansionNum > 2) then
	    local g = NRCAH:createGlyphString();
	    if (g) then
	        a.g = g;
	    end
    end
    a = NRCAH.serializer:Serialize(a);
    sendGroupComm("rd " .. NRCAH.version .. " " .. a);
end
NRCAH:checkMyRes(true);
NRCAH:checkMyEnchants(true);
if (not NRCAH.db.firstLoad) then
    NRCAH.db.firstLoad = true;
    C_Timer.After(10, function()
            NRCAH:sendRaidData();
    end)
end

--Also include the full LibDurability to operate seperately.
local LD = LibStub:NewLibrary("LibDurability", 2)
if not LD then return end -- No upgrade needed
-- Throttle times for separate channels
LD.throttleTable = LD.throttleTable or {
    ["RAID"] = 0,
    ["PARTY"] = 0,
    ["INSTANCE_CHAT"] = 0,
}
LD.throttleSendTable = LD.throttleSendTable or {
    ["RAID"] = 0,
    ["PARTY"] = 0,
    ["INSTANCE_CHAT"] = 0,
}
LD.callbackMap = LD.callbackMap or {}
LD.frame = LD.frame or CreateFrame("Frame")

local throttleTable = LD.throttleTable
local throttleSendTable = LD.throttleSendTable
local callbackMap = LD.callbackMap
local frame = LD.frame

local next, type, error, tonumber, format, match = next, type, error, tonumber, string.format, string.match
local Ambiguate, GetTime, GetInventoryItemDurability, IsInGroup, IsInRaid = Ambiguate, GetTime, GetInventoryItemDurability, IsInGroup, IsInRaid
local SendAddonMessage = C_ChatInfo.SendAddonMessage
local pName = UnitName("player")

local function GetDurability()
    local curTotal, maxTotal, broken = 0, 0, 0
    for i = 1, 18 do
        local curItemDurability, maxItemDurability = GetInventoryItemDurability(i)
        if curItemDurability and maxItemDurability then
            curTotal = curTotal + curItemDurability
            maxTotal = maxTotal + maxItemDurability
            if maxItemDurability > 0 and curItemDurability == 0 then
                broken = broken + 1
            end
        end
    end
    if maxTotal == 0 then
        return 0, 0
    else
        local percent = curTotal / maxTotal * 100
        return percent, broken
    end
end
LD.GetDurability = GetDurability

C_ChatInfo.RegisterAddonMessagePrefix("Durability")
frame:SetScript("OnEvent", function(_, _, prefix, msg, channel, sender)
        if prefix == "Durability" and throttleTable[channel] then
            if msg == "R" then
                local t = GetTime()
                if t - throttleTable[channel] > 4 then
                    throttleTable[channel] = t
                    local percent, broken = GetDurability()
                    SendAddonMessage("Durability", format("%d,%d", percent, broken), channel)
                end
                return
            end
            
            local percent, broken = match(msg, "^(%d+),(%d+)$")
            percent = tonumber(percent)
            broken = tonumber(broken)
            if percent and broken then
                for _,func in next, callbackMap do
                    func(percent, broken, Ambiguate(sender, "none"), channel)
                end
            end
        end
end)
frame:RegisterEvent("CHAT_MSG_ADDON")

-- For automatic group handling, don't pass a channel. The order is INSTANCE_CHAT > RAID > GROUP.
function LD:RequestDurability(channel)
    if channel and not throttleSendTable[channel] then
        error("LibDurability: Incorrect channel type for :RequestDurability.")
    else
        if not channel and IsInGroup() then
            channel = IsInGroup(2) and "INSTANCE_CHAT" or IsInRaid() and "RAID" or "PARTY"
        end
        
        local percent, broken = GetDurability()
        for _,func in next, callbackMap do
            func(percent, broken, pName, channel) -- This allows us to show our own durability when not grouped
        end
        
        if channel then
            local t = GetTime()
            if t - throttleSendTable[channel] > 4 then
                throttleSendTable[channel] = t
                SendAddonMessage("Durability", "R", channel)
            end
        end
    end
end

function LD:Register(addon, func)
    if not addon or addon == LD then
        error("LibDurability: You must pass your own addon name or object to :Register.")
    end
    
    local t = type(func)
    if t == "string" then
        callbackMap[addon] = function(...) addon[func](addon, ...) end
    elseif t == "function" then
        callbackMap[addon] = func
    else
        error("LibDurability: Incorrect function type for :Register.")
    end
end

function LD:Unregister(addon)
    if not addon or addon == LD then
        error("LibDurability: You must pass your own addon name or object to :Unregister.")
    end
    callbackMap[addon] = nil
end