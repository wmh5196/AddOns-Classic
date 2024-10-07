----------------------------
---NovaRaidCompanion Auras--
----------------------------

local addonName, NRC = ...;
local L = LibStub("AceLocale-3.0"):GetLocale("NovaRaidCompanion");
NRC.auraCache = {};
NRC.chronoCache = {};
local units = NRC.units;
local UnitBuff = UnitBuff;
local UnitDebuff = UnitDebuff;
local UnitName = UnitName;
local UnitGUID = UnitGUID;
local GetServerTime = GetServerTime;
local GetTime = GetTime;
local C_UnitAuras = C_UnitAuras;
local isClassic = NRC.isClassic;
local boons = {};
		
local chronoMap = {
	[17] = L["Fengus' Ferocity"],
	[18] = L["Mol'dar's Moxie"],
	[19] = L["Slip'kik's Savvy"],
	[20] = L["Rallying Cry of the Dragonslayer"],
	[21] = L["Warchief's Blessing"],
	[22] = L["Spirit of Zandalar"],
	[23] = L["Songflower Serenade"],
	[24] = L["Sayge's Fortune"], --Duration of the chosen DMF buff.
	[25] = L["Sayge's Fortune"], --spellID of the chosen DMF buff.
	[26] = L["Boon of Blackfathom"],
	[27] = L["Spark of Inspiration"], 
	[28] = L["Fervor of the Temple Explorer"],
	[29] = L["Might of Stormwind"],
};

local dmfBuffs = {
	[23768] = L["Sayge's Dark Fortune of Damage"],
	[23769] = L["Sayge's Dark Fortune of Resistance"],
	[23767] = L["Sayge's Dark Fortune of Armor"],
	[23766] = L["Sayge's Dark Fortune of Intelligence"],
	[23738] = L["Sayge's Dark Fortune of Spirit"],
	[23737] = L["Sayge's Dark Fortune of Stamina"],
	[23735] = L["Sayge's Dark Fortune of Strength"],
	[23736] = L["Sayge's Dark Fortune of Agility"],
};

--Unbooned buffs no don't give the correct max duration from API, but instead the duration left when it was unbooned.
--We only need boonable buffs here.

local customDurations = {};
if (isClassic) then
	customDurations = {
		[16609] = 3600, --Warchief's Blessing.
		[460939] = 3600, --Might of Stormwind.
		[22888] = 7200, --Rallying Cry of the Dragonslayer.	
		[24425] = 7200, --Spirit of Zandalar.
		[355366] = 3600, --Warchief's Blessing (Unbooned version).
		[460940] = 3600, --Might of Stormwind (Unbooned version).
		[355363] = 7200, --Rallying Cry of the Dragonslayer (Unbooned version).
		[355365] = 7200, --Spirit of Zandalar (Unbooned version).
		[22818] = 7200, --Mol'dar's Moxie.
		[22817] = 7200, --Fengus' Ferocity.
		[22820] = 7200, --Slip'kik's Savvy.
		[15366] = 3600, --Songflower Serenade.
		[430947] = 7200, --Boon of Blackfathom.
		[438536] = 7200, --Spark of Inspiration.
		[438537] = 7200, --Spark of Inspiration.
		[446695] = 7200, --Fervor of the Temple Explorer.
		[446698] = 7200, --Fervor of the Temple Explorer.
		[23768] = 7200, --Sayge's Dark Fortune of Damage.
		[23769] = 7200, --Sayge's Dark Fortune of Resistance.
		[23767] = 7200, --Sayge's Dark Fortune of Armor.
		[23766] = 7200, --Sayge's Dark Fortune of Intelligence.
		[23738] = 7200, --Sayge's Dark Fortune of Spirit.
		[23737] = 7200, --Sayge's Dark Fortune of Stamina.
		[23735] = 7200, --Sayge's Dark Fortune of Strength.
		[23736] = 7200, --Sayge's Dark Fortune of Agility.
	};
end

local function updateChronodata(guid, buffData, unit)
	if (unit and not buffData) then
		for i = 1, 60 do
			local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit, i);
			if (spellID) then
				if (spellID == 349981) then
					buffData = {UnitBuff(unit, i)};
					break;
				end
			else
				break;
			end
		end
	end
	--Chronoboon.
	local data = {};
	local dmfSpellID, dmfDuration;
	--This number and above table needs to be extended as more buffs are added to SoD.
	for i = 17, 29 do
		if (i == 24) then
			--Set dmf duration.
			if (buffData[24]) then
				dmfDuration = buffData[24];
			end
		elseif (i == 25) then
			--Set dmf spellID on next loop.
			if (buffData[25]) then
				dmfSpellID = buffData[25];
			end
			--If both exist then insert it.
			--Both can exist and still be 0 so ignore that too.
			if (dmfDuration and dmfSpellID and dmfDuration > 0) then
				local t = {
					name = dmfBuffs[dmfSpellID],
					duration = dmfDuration,
				};
				tinsert(data, t);
			end
		else
			local duration = buffData[i];
			if (duration and duration > 0) then
				local t = {
					name = chronoMap[i],
					duration = duration,
				};
				tinsert(data, t);
			end
		end
	end
	if (next(data)) then
		NRC.chronoCache[guid] = data;
	end
end









--auraTest = {};
local function scanUnit(unit)
	local serverTime = GetServerTime();
	local guid = UnitGUID(unit);
	if (guid) then
		local auras = {};
		NRC.auraCache[guid] = {};
		NRC.chronoCache[guid] = nil;
		for i = 1, 60 do
			--local auraData = C_UnitAuras.GetAuraDataByIndex(unit, i);
			local auraData = C_UnitAuras.GetBuffDataByIndex(unit, i);
			if (auraData) then
				--if (auraData.isHelpful) then
					local spellID = auraData.spellId;
					auras[spellID] = {
						name = auraData.name,
						duration = customDurations[spellID] or auraData.duration,
						icon = auraData.icon,
						source = auraData.source and UnitName(auraData.source),
						auraInstanceID = auraData.auraInstanceID,
						buff = true,
					};
					local endTime = serverTime + (auraData.expirationTime - GetTime());
					if (endTime > serverTime) then
						--If people go out of range it gives an endtime in the past.
						--Only update if it's a valid endtime so we don't overwrite data we already have.
						auras[spellID].endTime = endTime;
					end
					if (spellID == 349981) then
						--Chronoboon.
						updateChronodata(guid, nil, unit);
					end
				--end
			else
				break;
			end
		end
		NRC.auraCache[guid] = auras;
	end
end

--Scan whole group.
function NRC:aurasScanGroup()
	NRC.auraCache = {};
	NRC.chronoCache = {};
	local unitType = "party";
	if (IsInRaid()) then
		unitType = "raid";
	end
	local serverTime = GetServerTime();
	if (IsInGroup()) then
		for i = 1, GetNumGroupMembers() do
			local unit = unitType .. i;
			scanUnit(unit);
		end
	end
	--Scan ourself too.
	scanUnit("player");
end

local function unitAura(unit, data)
	local guid = UnitGUID(unit);
	if (guid and units[unit]) then
		if (not NRC.auraCache[guid]) then
			NRC.auraCache[guid] = {};
		end
		if (data.isFullUpdate) then
			scanUnit(unit);
		end
		local auras = NRC.auraCache[guid];
		local serverTime = GetServerTime();
		if (data.addedAuras) then
			for _, auraData in pairs(data.addedAuras) do
				if (auraData.isHelpful) then
					local spellID = auraData.spellId;
					auras[spellID] = {
						name = auraData.name,
						duration = customDurations[spellID] or auraData.duration,
						icon = auraData.icon,
						source = auraData.source and UnitName(auraData.source),
						auraInstanceID = auraData.auraInstanceID,
						buff = true,
					};
					local endTime = serverTime + (auraData.expirationTime - GetTime());
					if (endTime > serverTime) then
						--If people go out of range it gives an endtime in the past.
						--Only update if it's a valid endtime so we don't overwrite data we already have.
						auras[spellID].endTime = endTime;
					end
					if (spellID == 349981) then
						--Chronoboon.
						--print(unit, "booned")
						updateChronodata(guid, nil, unit);
					end
					--Backup chrono removal, can never have a world buff and chronoboon at same time.
					--if (customDurations[spellID]) then
					--	NRC.chronoCache[guid] = nil;
					--end
				end
			end
		end
		if (data.removedAuraInstanceIDs) then
			for _, auraInstanceID in pairs(data.removedAuraInstanceIDs) do
				for k, v in pairs(auras) do
					if (auraInstanceID == v.auraInstanceID) then
						auras[k] = nil;
						if (k == 349981) then
							--Chronoboon.
							NRC.chronoCache[guid] = nil;
							--print(unit, "unbooned")
						end
						break;
					end
				end
			end
		end
		if (data.updatedAuraInstanceIDs) then
			--NRC:debug(data.updatedAuraInstanceIDs)
			for _, auraInstanceID in pairs(data.updatedAuraInstanceIDs) do
				local auraData = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraInstanceID);
				if (auraData and auraData.isHelpful) then
					local spellID = auraData.spellId;
					auras[spellID] = {
						name = auraData.name,
						--endTime = serverTime + (expirationTime - GetTime()),
						--source = source,
						duration = customDurations[auraData.spellId] or auraData.duration,
						icon = auraData.icon,
						source = auraData.source and UnitName(auraData.source),
						auraInstanceID = auraData.auraInstanceID,
						buff = true,
					};
					local endTime = serverTime + (auraData.expirationTime - GetTime());
					if (endTime > serverTime) then
						--If people go out of range it gives an endtime in the past.
						--Only update if it's a valid endtime so we don't overwrite data we already have.
						auras[spellID].endTime = endTime;
					end
				end
			end
		end
	end
end




--[[local function unitAura(...)
	--This needs to be updated to use the new payload included with this event instead of checking all buffs.
	local unit = ...;
	local guid = UnitGUID(unit);
	--local hasBoon;
	
	if (guid and units[unit]) then
		if (isClassic) then
			NRC.chronoCache[guid] = nil;
		end
		local auras = {};
		local serverTime = GetServerTime();
		for i = 1, 60 do
			local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit, i);
			if (name) then
				auras[spellID] = {
					name = name,
					--endTime = serverTime + (expirationTime - GetTime()),
					--source = source,
					duration = customDurations[spellID] or duration,
					icon = icon,
					buff = true,
				};
				if (source) then
					auras[spellID].source = UnitName(source);
				end
				local endTime = serverTime + (expirationTime - GetTime());
				if (endTime > serverTime) then
					--If people go out of range it gives an endtime in the past.
					--Only update if it's a valid endtime so we don't overwrite data we already have.
					auras[spellID].endTime = endTime;
				end
				--if (not NRC.auraCache[guid] or not NRC.auraCache[guid][spellID]) then
				--	NRC:buffGained(guid, auras[spellID]);
				--end
				if (isClassic and spellID == 349981) then
					--Chronoboon.
					local buffData = {UnitBuff(unit, i)};
					updateChronodata(guid, buffData);
					--hasBoon = true;
				end
			else
				break;
			end
		end
		for i = 1, 60 do
			local name, icon, _, _, _, expirationTime, source, _, _, spellID = UnitDebuff(unit, i);
			if (name) then
				auras[spellID] = {
					name = name,
					--endTime = serverTime + (expirationTime - GetTime()),
					--source = source,
					icon = icon,
					debuff = true,
				};
				if (source) then
					auras[spellID].source = UnitName(source);
				end
				local endTime = serverTime + (expirationTime - GetTime());
				if (endTime > serverTime) then
					--If people go out of range it gives an endtime in the past.
					--Only update if it's a valid endtime so we don't overwrite data we already have.
					auras[spellID].endTime = 0;
				end
				--if (not NRC.auraCache[guid] or not NRC.auraCache[guid][spellID]) then
				--	NRC:debuffGained(guid, auras[spellID]);
				--end
			else
				break;
			end
		end
		--if (NRC.auraCache[guid]) then
		--	for k, v in pairs(NRC.auraCache[guid]) do
		--		if (not auras[k]) then
		--			if (v.buff) then
		--				NRC:buffFaded(guid, v);
		--			else
		--				NRC:debuffFaded(guid, v);
		--			end
		--		end
		--	end
		--end
		--if (isClassic and boons[guid] and not hasBoon) then
		
		--end
		NRC.auraCache[guid] = auras;
	end
end

--Scan whole group.
function NRC:aurasScanGroup()
	NRC.auraCache = {};
	NRC.chronoCache = {};
	--if (not IsInGroup()) then
	--	return;
	--end
	local unitType = "party";
	if (IsInRaid()) then
		unitType = "raid";
	end
	local serverTime = GetServerTime();
	if (IsInGroup()) then
		for i = 1, GetNumGroupMembers() do
			local unit = unitType .. i;
			local guid = UnitGUID(unit);
			if (guid) then
				for i = 1, 40 do
					local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit, i);
					if (name and spellID) then
						if (not NRC.auraCache[guid]) then
							NRC.auraCache[guid] = {};
						end
						NRC.auraCache[guid][spellID] = {
							name = name,
							--endTime = serverTime + (expirationTime - GetTime()),
							--source = source,
							duration = customDurations[spellID] or duration,
							icon = icon,
							buff = true,
						};
						if (source) then
							NRC.auraCache[guid][spellID].source = UnitName(source);
						end
						local endTime = serverTime + (expirationTime - GetTime());
						if (endTime > serverTime) then
							--If people go out of range it gives an endtime in the past.
							--Only update if it's a valid endtime so we don't overwrite data we already have.
							NRC.auraCache[guid][spellID].endTime = endTime;
						end
					end
					if (isClassic and spellID == 349981) then
						--Chronoboon.
						local buffData = {UnitBuff(unit, i)};
						updateChronodata(guid, buffData);
					end
					local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitDebuff(unit, i);
					if (name and spellID) then
						if (not NRC.auraCache[guid]) then
							NRC.auraCache[guid] = {};
						end
						NRC.auraCache[guid][spellID] = {
							name = name,
							--endTime = serverTime + (expirationTime - GetTime()),
							--source = source,
							icon = icon,
							debuff = true,
						};
						if (source) then
							NRC.auraCache[guid][spellID].source = UnitName(source);
						end
						local endTime = serverTime + (expirationTime - GetTime());
						if (endTime > serverTime) then
							--If people go out of range it gives an endtime in the past.
							--Only update if it's a valid endtime so we don't overwrite data we already have.
							NRC.auraCache[guid][spellID].endTime = endTime;
						end
					end
				end
			end
		end
	end
	--Scan ourself too.
	local unit = "player";
	local guid = UnitGUID(unit); 
	for i = 1, 40 do
		local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit, i);
		if (name) then
			if (not NRC.auraCache[guid]) then
				NRC.auraCache[guid] = {};
			end
			NRC.auraCache[guid][spellID] = {
				name = name,
				endTime = serverTime + (expirationTime - GetTime()),
				--source = source,
				duration = customDurations[spellID] or duration,
				icon = icon,
				buff = true,
			};
			if (source) then
				NRC.auraCache[guid][spellID].source = UnitName(source);
			end
			if (isClassic and spellID == 349981) then
				--Chronoboon.
				local buffData = {UnitBuff(unit, i)};
				updateChronodata(guid, buffData);
			end
		end
		local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitDebuff(unit, i);
		if (name) then
			if (not NRC.auraCache[guid]) then
				NRC.auraCache[guid] = {};
			end
			NRC.auraCache[guid][spellID] = {
				name = name,
				endTime = serverTime + (expirationTime - GetTime()),
				--source = source,
				icon = icon,
				debuff = true,
			};
			if (source) then
				NRC.auraCache[guid][spellID].source = UnitName(source);
			end
		end
	end
	--For testing, give myself all world buffs in aura cache.]]
	--[[if (NRC.isDebug) then
		local count = 0;
		if (not NRC.auraCache[guid]) then
			NRC.auraCache[guid] = {};
		end
		for k, v in pairs(NRC.worldBuffs) do
			if (not NRC.auraCache[guid]) then
				NRC.auraCache[guid] = {};
			end
			local hasDMF, hasSpark;
			for k, v in pairs(NRC.auraCache[guid]) do
				if (string.match(v.name, "Sayge's Dark Fortune")) then
					hasDMF = true;
				end
			end
			for k, v in pairs(NRC.auraCache[guid]) do
				if (string.match(v.name, "Spark of Inspiration")) then
					hasSpark = true;
				end
			end
			local hasDuplicate;
			for k, v in pairs(NRC.auraCache[guid]) do
				if (string.match(v.name, "Spark of Inspiration")) then
					hasDuplicate = true;
				end
			end
			if ((not hasDMF or not string.match(v.name, "Sayge's Dark Fortune") and
					(not hasSpark or not string.match(v.name, "Spark of Inspiration")))) then
				NRC.auraCache[guid][k] = {
					name = v.name,
					endTime = GetServerTime() + 600,
					duration = 3600,
					icon = v.icon,
					buff = true,
				};
			end
			count = count + 1;
			if (count == 4) then
				--break;
			end
		end
	end]]
--end

--[[function NRC:buffGained()

end

function NRC:debuffGained()

end

function NRC:buffFaded()

end

function NRC:debuffFaded()

end]]


--Keep a cache of all group members buffs, seperate frame for efficiency.
--Seperate events frame for this one for speed, no if statements.
local f = CreateFrame("Frame", "NRCAuras");
f:RegisterEvent("UNIT_AURA");
f:SetScript("OnEvent", function(self, event, ...)
	--local unit, data = ...;
	unitAura(...);
end)


local f = CreateFrame("Frame", "NRCAurasGroup");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:RegisterEvent("GROUP_FORMED");
f:RegisterEvent("GROUP_JOINED");
f:SetScript('OnEvent', function(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		--if (NRC.isDebug) then
		--	NRC.aurasScanGroup = NRC.aurasScanGroup2;
		--	unitAura = unitAura2;
		--end
		local isLogon, isReload = ...;
		if (isLogon or isReload) then
			--Scan ourself at logon even if not in a group.
			C_Timer.After(1, function()
				NRC:aurasScanGroup();
			end)
		else
			if (GetNumGroupMembers() > 1) then
				C_Timer.After(1, function()
					NRC:aurasScanGroup();
				end)
			end
	end
	elseif (event == "GROUP_FORMED" or event == "GROUP_JOINED") then
		if (GetNumGroupMembers() > 1) then
			C_Timer.After(1, function()
				NRC:aurasScanGroup();
			end)
			C_Timer.After(10, function()
				NRC:aurasScanGroup();
			end)
		end
	end
end)

--Debug func to scan for any chronboon buff slot changes.
--[[function chronoTest()
	for i = 1, 60 do
		local name = UnitBuff("target", i);
		if (name == "Supercharged Chronoboon Displacer") then
			local buffData = {UnitBuff("target", i)};
			for k, v in NRC:pairsByKeys(buffData) do
				print(k, v)
			end
		end
	end
end]]

--[[function NRC:testAuraCache()
	local cache = {};
	local unitType = "party";
	if (IsInRaid()) then
		unitType = "raid";
	end
	if (IsInGroup()) then
		for i = 1, GetNumGroupMembers() do
			local unit = unitType .. i;
			local guid = UnitGUID(unit);
			if (guid) then
				for i = 1, 40 do
					local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit, i);
					if (name and spellID) then
						if (not cache[guid]) then
							cache[guid] = {};
						end
						cache[guid][spellID] = true;
					end
				end
			end
		end
	end
	--Scan ourself too.
	local unit = "player";
	local guid = UnitGUID(unit); 
	for i = 1, 40 do
		local name, icon, _, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit, i);
		if (name) then
			if (not cache[guid]) then
				cache[guid] = {};
			end
			cache[guid][spellID] = true;
		end
	end
	
	print("Checking local cache.");
	for k, v in pairs(NRC.auraCache) do
		if (not cache[k]) then
			print("Missing char:", k);
		else
			for kk, vv in pairs(cache[k]) do
				if (not v[kk]) then
					print("Missing buff:", kk);
				end
			end
		end
	end
	print("Checking real cache.");
	for k, v in pairs(cache) do
		if (not NRC.auraCache[k]) then
			print("Missing char:", k);
		else
			for kk, vv in pairs(NRC.auraCache[k]) do
				if (not v[kk]) then
					print("Missing buff:", kk);
				end
			end
		end
	end
end]]