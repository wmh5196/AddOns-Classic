--------------------------------
---NovaRaidCompanion Equipment--
--------------------------------

local addonName, NRC = ...;
local L = LibStub("AceLocale-3.0"):GetLocale("NovaRaidCompanion");
NRC.equipCache = {};
local GetInventoryItemID = GetInventoryItemID;
local slotsChangedCache = {};

function NRC:hasOnyCloakEquipped(guid)
	local data = NRC.equipCache[guid];
	if (data and data[15] and data[15] == 15138) then
		return true;
	end
end

--If itemID is 0 then share any item we have in that slot, otherwise only share if the item is the one we want to know about.
local shareEquip = {};
if (NRC.isClassic) then
	shareEquip = {
		[15] = {15138}, --Ony cloak.
	};
end

--Called by NRC:createRaidData() in Data.lua and here below when a slot changes gear.
function NRC:getEquipToShare(fullSend)
	--Only share if something is set to share, otherwise we still send an empty table to show slot is not the item we want to know about.
	--Unless spellID set to 0 above then we share any item in that slot.
	local toShare = {};
	if (next(slotsChangedCache) and not fullSend) then
		--If we specify slots then only share those slots.
		toShare = {};
		for slot, _ in pairs(slotsChangedCache) do
			if (shareEquip[slot]) then
				toShare = {
					[slot] = shareEquip[slot],
				};
			end
		end
		slotsChangedCache = {};
	else
		toShare = shareEquip;
	end
	if (next(toShare)) then
		local data = {};
		for slot, itemIDs in pairs(toShare) do
			local equippedID = GetInventoryItemID("player", slot);
			if (equippedID) then
				for _, itemID in pairs(itemIDs) do
					if (itemID == 0 or itemID == equippedID) then
						data[slot] = equippedID;
						break;
					end
				end
			end
		end
		return data;
	end
end

function NRC:checkMyEquip()
	local data = NRC:getEquipToShare(true);
	if (not data) then
		return;
	end
	local me = UnitName("player");
	NRC.equipCache[me] = data;
end

--fullSend isn't used here yet, it's only used in the above func instead when full raid data is sent and the raid data func creates that table.
function NRC:sendEquipToShare(fullSend)
	NRC:checkMyEquip();
	if (not IsInGroup()) then
		return;
	end
	local equip = NRC:getEquipToShare(fullSend);
	if (equip) then
		local me = UnitName("player");
		NRC.equipCache[me] = equip;
		NRC:debug("sending equip update");
		local data = NRC.serializer:Serialize(equip);
		NRC:sendGroupComm("eq " .. NRC.version .. " " .. data);
	end
end

function NRC:receivedEquip(data, sender, distribution)
	local name, realm = strsplit("-", sender, 2);
	if (realm == NRC.realm or realm == GetNormalizedRealmName()) then
		sender = name;
	end
	--NRC:debug("received talents update from", sender);
	local deserializeResult, raidData = NRC.serializer:Deserialize(data);
	if (not deserializeResult) then
		NRC:debug("Failed to deserialize talents.");
		return;
	end
	NRC:debug("received equip update");
	NRC.equipCache[sender] = raidData;
end

local f = CreateFrame("Frame", "NRCEquip");
f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
f:SetScript('OnEvent', function(self, event, ...)
	if (event == "PLAYER_EQUIPMENT_CHANGED") then
		local slot = ...;
		--Create a list of all slots that need updating and then send, so we don't spam send when a equip manager changes a bunch of slots at once.
		slotsChangedCache[slot] = true;
		NRC:throddleEventByFunc(event, 1, "sendEquipToShare", ...);
	end
end)