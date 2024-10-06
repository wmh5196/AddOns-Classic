-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW
local function C_Map_GetAreaInfo(id)
	local d = C_Map.GetAreaInfo(id)
	return d or "GetAreaInfo"..id
end

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname = ...
local AtlasLoot = _G.AtlasLoot
local data = AtlasLoot.ItemDB:Add(addonname, 1, AtlasLoot.CLASSIC_VERSION_NUM)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local GetForVersion = AtlasLoot.ReturnForGameVersion

local NORMAL_DIFF = data:AddDifficulty("NORMAL", nil, nil, nil, true)
local RAID10_DIFF = data:AddDifficulty("10RAID")
local RAID20_DIFF = data:AddDifficulty("20RAID")
local RAID40_DIFF = data:AddDifficulty("40RAID")

local ALLIANCE_DIFF, HORDE_DIFF, LOAD_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
	LOAD_DIFF = HORDE_DIFF
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)
	LOAD_DIFF = ALLIANCE_DIFF
end

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local SET_ITTYPE = data:AddItemTableType("Set", "Item")

local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local SET_EXTRA_ITTYPE = data:AddExtraItemTableType("Set")

local COLLECTION_CONTENT = data:AddContentType(AL["SoD Collections"], ATLASLOOT_RAID40_COLOR)
local DUNGEON_CONTENT = data:AddContentType(AL["Dungeons"], ATLASLOOT_DUNGEON_COLOR)
local RAID20_CONTENT = data:AddContentType(AL["20 Raids"], ATLASLOOT_RAID20_COLOR)
local RAID40_CONTENT = data:AddContentType(AL["40 Raids"], ATLASLOOT_RAID40_COLOR)
local SET_CONTENT = data:AddContentType(AL["Sets"], ATLASLOOT_PVP_COLOR)

local ATLAS_MODULE_NAME = "Atlas_ClassicWoW"

local BLUE = "|cff6666ff%s|r"
--local GREY = "|cff999999%s|r"
local GREEN = "|cff66cc33%s|r"
local _RED = "|cffcc6666%s|r"
local PURP = "|cff9900ff%s|r"
local WHIT = "|cffffffff%s|r"

data["TierSets"] = {
	name = AL["Tier Sets"],
	ContentType = SET_CONTENT,
	TableType = SET_ITTYPE,
	items = {
		{ -- T1
			name = format(AL["Tier %s Sets"], "1"),
			CoinTexture = "CLASSIC",
			[NORMAL_DIFF] = {
				{ 1, 203 }, -- Warlock
				{ 3, 202 }, -- Priest
				{ 16, 201 }, -- Mage
				{ 5, 204 }, -- Rogue
				{ 20, 205 }, -- Druid
				{ 7, 206 }, -- Hunter
				{ 9, 209 }, -- Warrior
				{ 22, 207 }, -- Shaman
				{ 24, 208 }, -- Paladin
			},
		},
		{ -- T2
			name = format(AL["Tier %s Sets"], "2"),
			CoinTexture = "CLASSIC",
			[NORMAL_DIFF] = {
				{ 1, 212 }, -- Warlock
				{ 3, 211 }, -- Priest
				{ 16, 210 }, -- Mage
				{ 5, 213 }, -- Rogue
				{ 20, 214 }, -- Druid
				{ 7, 215 }, -- Hunter
				{ 9, 218 }, -- Warrior
				{ 22, 216 }, -- Shaman
				{ 24, 217 }, -- Paladin
			},
		},
		{ -- T2.5
			name = format(AL["Tier %s Sets"], "2.5"),
			CoinTexture = "CLASSIC",
			[NORMAL_DIFF] = {
				{ 1, 499 }, -- Warlock
				{ 3, 507 }, -- Priest
				{ 16, 503 }, -- Mage
				{ 5, 497 }, -- Rogue
				{ 20, 493 }, -- Druid
				{ 7, 509 }, -- Hunter
				{ 9, 496 }, -- Warrior
				{ 22, 501 }, -- Shaman
				{ 24, 505 }, -- Paladin
			},
		},
		{ -- T3
			name = format(AL["Tier %s Sets"], "3"),
			CoinTexture = "CLASSIC",
			[NORMAL_DIFF] = {
				{ 1, 529 }, -- Warlock
				{ 3, 525 }, -- Priest
				{ 16, 526 }, -- Mage
				{ 5, 524 }, -- Rogue
				{ 20, 521 }, -- Druid
				{ 7, 530 }, -- Hunter
				{ 9, 523 }, -- Warrior
				{ 22, 527 }, -- Shaman
				{ 24, 528 }, -- Paladin
			},
		},
	},
}

data["DungeonSets"] = {
	name = AL["Dungeon Sets"],
	ContentType = SET_CONTENT,
	TableType = SET_ITTYPE,
	items = {
		{ -- T0 / D1
			name = format(AL["Dungeon Set %s"], "1"),
			[NORMAL_DIFF] = {
				{ 1, 183 }, -- Warlock
				{ 3, 182 }, -- Priest
				{ 16, 181 }, -- Mage
				{ 5, 184 }, -- Rogue
				{ 20, 185 }, -- Druid
				{ 7, 186 }, -- Hunter
				{ 9, 189 }, -- Warrior
				{ 22, 187 }, -- Shaman
				{ 24, 188 }, -- Paladin
			},
		},
		{ -- T0.5 / D2
			name = format(AL["Dungeon Set %s"], "2"),
			[NORMAL_DIFF] = {
				{ 1, 518 }, -- Warlock
				{ 3, 514 }, -- Priest
				{ 16, 517 }, -- Mage
				{ 5, 512 }, -- Rogue
				{ 20, 513 }, -- Druid
				{ 7, 515 }, -- Hunter
				{ 9, 511 }, -- Warrior
				{ 22, 519 }, -- Shaman
				{ 24, 516 }, -- Paladin
			},
		},
	}
}

data["ZGSets"] = {
	name = format(AL["%s Sets"], C_Map_GetAreaInfo(1977)),
	ContentType = SET_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	TableType = SET_ITTYPE,
	gameVersion = AtlasLoot.CLASSIC_VERSION_NUM,
	ContentPhase = 4,
	items = {
		{
			name = format(AL["%s Sets"], C_Map_GetAreaInfo(1977)),
			[ALLIANCE_DIFF] = {
				{ 1,  481 }, -- Warlock
				{ 3,  480 }, -- Priest
				{ 16, 482 }, -- Mage
				{ 5,  478 }, -- Rogue
				{ 20, 479 }, -- Druid
				{ 7,  477 }, -- Hunter
				{ 9,  474 }, -- Warrior
				{ 24, 475 }, -- Paladin
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 22, 476 }, -- Shaman
				{ 24 }, -- Paladin
			},
		},
		{ -- Misc
			name = format(AL["%s Sets"], AL["Misc"]),
			[NORMAL_DIFF] = {
				-- Swords
				{ 1,  461 }, -- Warblade of the Hakkari
				{ 3,  463 }, -- Primal Blessing
				-- Rings
				{ 16,  466 }, -- Major Mojo Infusion
				{ 17,  462 }, -- Zanzil's Concentration
				{ 18,  465 }, -- Prayer of the Primal
				{ 19,  464 }, -- Overlord's Resolution
			},
		},
	},
}

data["AQSets"] = {
	name = format(AL["%s Sets"], C_Map_GetAreaInfo(3428)),
	ContentType = SET_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	TableType = SET_ITTYPE,
	gameVersion = AtlasLoot.CLASSIC_VERSION_NUM,
	ContentPhase = 5,
	items = {
		{ -- AQ20
			name = format(AL["%s Sets"], C_Map_GetAreaInfo(3428).." 20"),
			[ALLIANCE_DIFF] = {
				{ 1,  500 }, -- Warlock
				{ 3,  508 }, -- Priest
				{ 16, 504 }, -- Mage
				{ 5,  498 }, -- Rogue
				{ 20, 494 }, -- Druid
				{ 7,  510 }, -- Hunter
				{ 9,  495 }, -- Warrior
				{ 24, 506 }, -- Paladin
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 22, 502 }, -- Shaman
				{ 24 }, -- Paladin
			},
		},
		{ -- AQ40
			name = format(AL["%s Sets"], C_Map_GetAreaInfo(3428).." 40"),
			[ALLIANCE_DIFF] = {
				{ 1,  499 }, -- Warlock
				{ 3,  507 }, -- Priest
				{ 16, 503 }, -- Mage
				{ 5,  497 }, -- Rogue
				{ 20, 493 }, -- Druid
				{ 7,  509 }, -- Hunter
				{ 9,  496 }, -- Warrior
				{ 24, 505 }, -- Paladin
			},
			[HORDE_DIFF] = {
				GetItemsFromDiff = ALLIANCE_DIFF,
				{ 22, 501 }, -- Shaman
				{ 24 }, -- Paladin
			},
		},
	},
}

data["MiscSets"] = {
	name = format(AL["%s Sets"], AL["Misc"]),
	ContentType = SET_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	TableType = SET_ITTYPE,
	gameVersion = AtlasLoot.CLASSIC_VERSION_NUM,
	items = {
		{ -- Cloth
			name = ALIL["Cloth"],
			[NORMAL_DIFF] = {
				{ 1,  421 }, -- Bloodvine Garb / 65
				{ 2,  520 }, -- Ironweave Battlesuit / 61-63
				{ 3,  122 }, -- Necropile Raiment / 61
				{ 4,  81 }, -- Twilight Trappings / 61
				{ 5,  492 }, -- Twilight Trappings / 60
				{ 16,  536 }, -- Regalia of Undead Cleansing / 63
			},
		},
		{ -- Leather
			name = ALIL["Leather"],
			[NORMAL_DIFF] = {
				{ 1,  442 }, -- Blood Tiger Harness / 65
				{ 2,  441 }, -- Primal Batskin / 65
				{ 3,  121 }, -- Cadaverous Garb / 61
				{ 4,  142 }, -- Stormshroud Armor / 55-62
				{ 5,  141 }, -- Volcanic Armor / 54-61
				{ 6,  143 }, -- Devilsaur Armor / 58-60
				{ 7,  144 }, -- Ironfeather Armor / 54-58
				{ 8,  534 }, -- Undead Slayer's Armor / 63
				{ 9,  161 }, -- Defias Leather / 18-24
				{ 10,  162 }, -- Embrace of the Viper / 19-23
				{ 16,  221 }, -- Garb of Thero-shan / 32-42
			},
		},
		{ -- Mail
			name = ALIL["Mail"],
			[NORMAL_DIFF] = {
				{ 1,  443 }, -- Bloodsoul Embrace / 65
				{ 2,  123 }, -- Bloodmail Regalia / 61
				{ 3,  489 }, -- Black Dragon Mail / 58-62
				{ 4,  491 }, -- Blue Dragon Mail / 57-60
				{ 5,  1 }, -- The Gladiator / 57
				{ 6,  490 }, -- Green Dragon Mail / 52-56
				{ 7,  163 }, -- Chain of the Scarlet Crusade / 35-43
				{ 16,  535 }, -- Garb of the Undead Slayer / 63
			},
		},
		{ -- Plate
			name = ALIL["Plate"],
			[NORMAL_DIFF] = {
				{ 1,  444 }, -- The Darksoul / 65
				{ 2,  124 }, -- Deathbone Guardian / 61
				{ 3,  321 }, -- Imperial Plate / 53-61
				{ 16,  533 }, -- Battlegear of Undead Slaying / 63
			},
		},
		{ -- Misc
			name = format(AL["%s Sets"], AL["Misc"]),
			[NORMAL_DIFF] = {
				-- Fist weapons
				{ 1,  261 }, -- Spirit of Eskhandar
				-- Swords
				{ 3,  41 }, -- Dal'Rend's Arms
				-- Dagger / Mace
				{ 5,  65 }, -- Spider's Kiss
				-- Trinket
				{ 16,  241 }, -- Shard of the Gods / 60
			},
		},
	},
}

data["WorldBosses"] = {
	name = AL["World Bosses"],
	AtlasMapFile = "Azuregos",
	ContentType = RAID40_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	ContentPhase = 2,
	items = {
		{ -- AAzuregos
			name = AL["Azuregos"],
			AtlasMapFile = "Azuregos",
			npcID = 6109,
			Level = 999,
			ContentPhase = 2,
			DisplayIDs = {{11460}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  19132 }, -- Crystal Adorned Crown
				{ 2,  18208 }, -- Drape of Benediction
				{ 3,  18541 }, -- Puissant Cape
				{ 4,  18547 }, -- Unmelting Ice Girdle
				{ 5,  18545 }, -- Leggings of Arcane Supremacy
				{ 6,  19131 }, -- Snowblind Shoes
				{ 7,  19130 }, -- Cold Snap
				{ 8,  17070 }, -- Fang of the Mystics
				{ 9,  18202 }, -- Eskhandar's Left Claw
				{ 10, 18542 }, -- Typhoon
				{ 16, 18704 }, -- Mature Blue Dragon Sinew
				{ 18, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
		{ -- KKazzak
			name = AL["Lord Kazzak"],
			AtlasMapFile = "LordKazzak",
			npcID = 12397,
			Level = 999,
			ContentPhase = 2,
			DisplayIDs = {{12449}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  18546 }, -- Infernal Headcage
				{ 2,  17111 }, -- Blazefury Medallion
				{ 3,  18204 }, -- Eskhandar's Pelt
				{ 4,  19135 }, -- Blacklight Bracer
				{ 5,  18544 }, -- Doomhide Gauntlets
				{ 6,  19134 }, -- Flayed Doomguard Belt
				{ 7,  19133 }, -- Fel Infused Leggings
				{ 8,  18543 }, -- Ring of Entropy
				{ 9,  17112 }, -- Empyrean Demolisher
				{ 10, 17113 }, -- Amberseal Keeper
				{ 16, 18665 }, -- The Eye of Shadow
				{ 18, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
		{ -- DLethon
			name = AL["Lethon"],
			AtlasMapFile = "FourDragons",
			npcID = 14888,
			Level = 999,
			ContentPhase = 4,
			DisplayIDs = {{15365}},
			[NORMAL_DIFF] = {
				{ 1,  20628 }, -- Deviate Growth Cap
				{ 2,  20626 }, -- Black Bark Wristbands
				{ 3,  20630 }, -- Gauntlets of the Shining Light
				{ 4,  20625 }, -- Belt of the Dark Bog
				{ 5,  20627 }, -- Dark Heart Pants
				{ 6,  20629 }, -- Malignant Footguards
				{ 9,  20579 }, -- Green Dragonskin Cloak
				{ 10, 20615 }, -- Dragonspur Wraps
				{ 11, 20616 }, -- Dragonbone Wristguards
				{ 12, 20618 }, -- Gloves of Delusional Power
				{ 13, 20617 }, -- Ancient Corroded Leggings
				{ 14, 20619 }, -- Acid Inscribed Greaves
				{ 15, 20582 }, -- Trance Stone
				{ 16, 20644 }, -- Nightmare Engulfed Object
				{ 17, 20600 }, -- Malfurion's Signet Ring
				{ 24, 20580 }, -- Hammer of Bestial Fury
				{ 25, 20581 }, -- Staff of Rampant Growth
				{ 29, 20381 }, -- Dreamscale
				{ 30, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
		{ -- DEmeriss
			name = AL["Emeriss"],
			AtlasMapFile = "FourDragons",
			npcID = 14889,
			Level = 999,
			ContentPhase = 4,
			DisplayIDs = {{15366}},
			[NORMAL_DIFF] = {
				{ 1,  20623 }, -- Circlet of Restless Dreams
				{ 2,  20622 }, -- Dragonheart Necklace
				{ 3,  20624 }, -- Ring of the Unliving
				{ 4,  20621 }, -- Boots of the Endless Moor
				{ 5,  20599 }, -- Polished Ironwood Crossbow
				{ 9,  20579 }, -- Green Dragonskin Cloak
				{ 10, 20615 }, -- Dragonspur Wraps
				{ 11, 20616 }, -- Dragonbone Wristguards
				{ 12, 20618 }, -- Gloves of Delusional Power
				{ 13, 20617 }, -- Ancient Corroded Leggings
				{ 14, 20619 }, -- Acid Inscribed Greaves
				{ 15, 20582 }, -- Trance Stone
				{ 16, 20644 }, -- Nightmare Engulfed Object
				{ 17, 20600 }, -- Malfurion's Signet Ring
				{ 24, 20580 }, -- Hammer of Bestial Fury
				{ 25, 20581 }, -- Staff of Rampant Growth
				{ 30, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
		{ -- DTaerar
			name = AL["Taerar"],
			AtlasMapFile = "FourDragons",
			npcID = 14890,
			Level = 999,
			ContentPhase = 4,
			DisplayIDs = {{15363}, {15367}},
			[NORMAL_DIFF] = {
				{ 1,  20633 }, -- Unnatural Leather Spaulders
				{ 2,  20631 }, -- Mendicant's Slippers
				{ 3,  20634 }, -- Boots of Fright
				{ 4,  20632 }, -- Mindtear Band
				{ 5,  20577 }, -- Nightmare Blade
				{ 9,  20579 }, -- Green Dragonskin Cloak
				{ 10, 20615 }, -- Dragonspur Wraps
				{ 11, 20616 }, -- Dragonbone Wristguards
				{ 12, 20618 }, -- Gloves of Delusional Power
				{ 13, 20617 }, -- Ancient Corroded Leggings
				{ 14, 20619 }, -- Acid Inscribed Greaves
				{ 15, 20582 }, -- Trance Stone
				{ 16, 20644 }, -- Nightmare Engulfed Object
				{ 17, 20600 }, -- Malfurion's Signet Ring
				{ 24, 20580 }, -- Hammer of Bestial Fury
				{ 25, 20581 }, -- Staff of Rampant Growth
				{ 30, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
		{ -- DYsondre
			name = AL["Ysondre"],
			AtlasMapFile = "FourDragons",
			npcID = 14887,
			Level = 999,
			ContentPhase = 4,
			DisplayIDs = {{15364}},
			[NORMAL_DIFF] = {
				{ 1,  20637 }, -- Acid Inscribed Pauldrons
				{ 2,  20635 }, -- Jade Inlaid Vestments
				{ 3,  20638 }, -- Leggings of the Demented Mind
				{ 4,  20639 }, -- Strangely Glyphed Legplates
				{ 5,  20636 }, -- Hibernation Crystal
				{ 6,  20578 }, -- Emerald Dragonfang
				{ 9,  20579 }, -- Green Dragonskin Cloak
				{ 10, 20615 }, -- Dragonspur Wraps
				{ 11, 20616 }, -- Dragonbone Wristguards
				{ 12, 20618 }, -- Gloves of Delusional Power
				{ 13, 20617 }, -- Ancient Corroded Leggings
				{ 14, 20619 }, -- Acid Inscribed Greaves
				{ 15, 20582 }, -- Trance Stone
				{ 16, 20644 }, -- Nightmare Engulfed Object
				{ 17, 20600 }, -- Malfurion's Signet Ring
				{ 24, 20580 }, -- Hammer of Bestial Fury
				{ 25, 20581 }, -- Staff of Rampant Growth
				{ 30, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
	}
}

data["MoltenCore"] = {
	name = AL["Molten Core"],
	ContentType = RAID40_CONTENT,
	LoadDifficulty = RAID40_DIFF,
	items = {
		{	--MCLucifron
			name = AL["Lucifron"],
			npcID = 12118,
			Level = 999,
			DisplayIDs = {{13031},{12030}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1, 16800 },	-- Arcanist Boots
				{ 2, 16805 },	-- Felheart Gloves
				{ 3, 16829 },	-- Cenarion Boots
				{ 4, 16837 },	-- Earthfury Boots
				{ 5, 16859 },	-- Lawbringer Boots
				{ 6, 16863 },	-- Gauntlets of Might
				{ 16, 18870 },	-- Helm of the Lifegiver
				{ 17, 17109 },	-- Choker of Enlightenment
				{ 18, 19145 },	-- Robe of Volatile Power
				{ 19, 19146 },	-- Wristguards of Stability
				{ 20, 18872 },	-- Manastorm Leggings
				{ 21, 18875 },	-- Salamander Scale Pants
				{ 22, 18861 },	-- Flamewaker Legplates
				{ 23, 18879 },	-- Heavy Dark Iron Ring
				{ 24, 19147 },	-- Ring of Spell Power
				{ 25, 17077 },	-- Crimson Shocker
				{ 26, 18878 },	-- Sorcerous Dagger
				{ 30, 16665 },	-- Tome of Tranquilizing Shot
			},
		},
		{	--MCMagmadar
			name = AL["Magmadar"],
			npcID = 11982,
			Level = 999,
			DisplayIDs = {{10193}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  16814 },	-- Pants of Prophecy
				{ 2,  16796 },	-- Arcanist Leggings
				{ 3,  16810 },	-- Felheart Pants
				{ 4,  16822 },	-- Nightslayer Pants
				{ 5,  16835 },	-- Cenarion Leggings
				{ 6,  16847 },	-- Giantstalker's Leggings
				{ 7,  16843 },	-- Earthfury Legguards
				{ 8,  16855 },	-- Lawbringer Legplates
				{ 9,  16867 },	-- Legplates of Might
				{ 11, 18203 },	-- Eskhandar's Right Claw
				{ 16, 17065 },	-- Medallion of Steadfast Might
				{ 17, 18829 },	-- Deep Earth Spaulders
				{ 18, 18823 },	-- Aged Core Leather Gloves
				{ 19, 19143 },	-- Flameguard Gauntlets
				{ 20, 19136 },	-- Mana Igniting Cord
				{ 21, 18861 },	-- Flamewaker Legplates
				{ 22, 19144 },	-- Sabatons of the Flamewalker
				{ 23, 18824 },	-- Magma Tempered Boots
				{ 24, 18821 },	-- Quick Strike Ring
				{ 25, 18820 },	-- Talisman of Ephemeral Power
				{ 26, 19142 },	-- Fire Runed Grimoire
				{ 27, 17069 },	-- Striker's Mark
				{ 28, 17073 },	-- Earthshaker
				{ 29, 18822 },	-- Obsidian Edged Blade
			},
		},
		{	--MCGehennas
			name = AL["Gehennas"],
			npcID = 12259,
			Level = 999,
			DisplayIDs = {{13030},{12002}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  16812 },	-- Gloves of Prophecy
				{ 2,  16826 },	-- Nightslayer Gloves
				{ 3,  16849 },	-- Giantstalker's Boots
				{ 4,  16839 },	-- Earthfury Gauntlets
				{ 5,  16860 },	-- Lawbringer Gauntlets
				{ 6,  16862 },	-- Sabatons of Might
				{ 16, 18870 },	-- Helm of the Lifegiver
				{ 17, 19145 },	-- Robe of Volatile Power
				{ 18, 19146 },	-- Wristguards of Stability
				{ 19, 18872 },	-- Manastorm Leggings
				{ 20, 18875 },	-- Salamander Scale Pants
				{ 21, 18861 },	-- Flamewaker Legplates
				{ 22, 18879 },	-- Heavy Dark Iron Ring
				{ 23, 19147 },	-- Ring of Spell Power
				{ 24, 17077 },	-- Crimson Shocker
				{ 25, 18878 },	-- Sorcerous Dagger
			},
		},
		{	--MCGarr
			name = AL["Garr"],
			npcID = 12057,
			Level = 999,
			DisplayIDs = {{12110}, {5781}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1, 18564 },	-- Bindings of the Windseeker
				{ 3,  16813 },	-- Circlet of Prophecy
				{ 4,  16795 },	-- Arcanist Crown
				{ 5,  16808 },	-- Felheart Horns
				{ 6,  16821 },	-- Nightslayer Cover
				{ 7,  16834 },	-- Cenarion Helm
				{ 8,  16846 },	-- Giantstalker's Helmet
				{ 9,  16842 },	-- Earthfury Helmet
				{ 10,  16854 },	-- Lawbringer Helm
				{ 11,  16866 },	-- Helm of Might
				{ 16, 18829 },	-- Deep Earth Spaulders
				{ 17, 18823 },	-- Aged Core Leather Gloves
				{ 18, 19143 },	-- Flameguard Gauntlets
				{ 19, 19136 },	-- Mana Igniting Cord
				{ 20, 18861 },	-- Flamewaker Legplates
				{ 21, 19144 },	-- Sabatons of the Flamewalker
				{ 22, 18824 },	-- Magma Tempered Boots
				{ 23, 18821 },	-- Quick Strike Ring
				{ 24, 18820 },	-- Talisman of Ephemeral Power
				{ 25, 19142 },	-- Fire Runed Grimoire
				{ 26, 17066 },	-- Drillborer Disk
				{ 27, 17071 },	-- Gutgore Ripper
				{ 28, 17105 },	-- Aurastone Hammer
				{ 29, 18832 },	-- Brutality Blade
				{ 30, 18822 },	-- Obsidian Edged Blade
			},
		},
		{	--MCShazzrah
			name = AL["Shazzrah"],
			npcID = 12264,
			Level = 999,
			DisplayIDs = {{13032}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  16811 },	-- Boots of Prophecy
				{ 2,  16801 },	-- Arcanist Gloves
				{ 3,  16803 },	-- Felheart Slippers
				{ 4,  16824 },	-- Nightslayer Boots
				{ 5,  16831 },	-- Cenarion Gloves
				{ 6,  16852 },	-- Giantstalker's Gloves
				{ 16, 18870 },	-- Helm of the Lifegiver
				{ 17, 19145 },	-- Robe of Volatile Power
				{ 18, 19146 },	-- Wristguards of Stability
				{ 19, 18872 },	-- Manastorm Leggings
				{ 20, 18875 },	-- Salamander Scale Pants
				{ 21, 18861 },	-- Flamewaker Legplates
				{ 22, 18879 },	-- Heavy Dark Iron Ring
				{ 23, 19147 },	-- Ring of Spell Power
				{ 24, 17077 },	-- Crimson Shocker
				{ 25, 18878 },	-- Sorcerous Dagger
			},
		},
		{	--MCGeddon
			name = AL["Baron Geddon"],
			npcID = 12056,
			Level = 999,
			DisplayIDs = {{12129}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  18563 },	-- Bindings of the Windseeker
				{ 3,  16797 },	-- Arcanist Mantle
				{ 4,  16807 },	-- Felheart Shoulder Pads
				{ 5,  16836 },	-- Cenarion Spaulders
				{ 6,  16844 },	-- Earthfury Epaulets
				{ 7,  16856 },	-- Lawbringer Spaulders
				{ 16, 18829 },	-- Deep Earth Spaulders
				{ 17, 18823 },	-- Aged Core Leather Gloves
				{ 18, 19143 },	-- Flameguard Gauntlets
				{ 19, 19136 },	-- Mana Igniting Cord
				{ 20, 18861 },	-- Flamewaker Legplates
				{ 21, 19144 },	-- Sabatons of the Flamewalker
				{ 22, 18824 },	-- Magma Tempered Boots
				{ 23, 18821 },	-- Quick Strike Ring
				{ 24, 17110 },	-- Seal of the Archmagus
				{ 25, 18820 },	-- Talisman of Ephemeral Power
				{ 26, 19142 },	-- Fire Runed Grimoire
				{ 27, 18822 },	-- Obsidian Edged Blade
			},
		},
		{	--MCGolemagg
			name = AL["Golemagg the Incinerator"],
			npcID = 11988,
			Level = 999,
			DisplayIDs = {{11986}},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1,  16815 },	-- Robes of Prophecy
				{ 2,  16798 },	-- Arcanist Robes
				{ 3,  16809 },	-- Felheart Robes
				{ 4,  16820 },	-- Nightslayer Chestpiece
				{ 5,  16833 },	-- Cenarion Vestments
				{ 6,  16845 },	-- Giantstalker's Breastplate
				{ 7,  16841 },	-- Earthfury Vestments
				{ 8,  16853 },	-- Lawbringer Chestguard
				{ 9,  16865 },	-- Breastplate of Might
				{ 11, 17203 },	-- Sulfuron Ingot
				{ 16, 18829 },	-- Deep Earth Spaulders
				{ 17, 18823 },	-- Aged Core Leather Gloves
				{ 18, 19143 },	-- Flameguard Gauntlets
				{ 19, 19136 },	-- Mana Igniting Cord
				{ 20, 18861 },	-- Flamewaker Legplates
				{ 21, 19144 },	-- Sabatons of the Flamewalker
				{ 22, 18824 },	-- Magma Tempered Boots
				{ 23, 18821 },	-- Quick Strike Ring
				{ 24, 18820 },	-- Talisman of Ephemeral Power
				{ 25, 19142 },	-- Fire Runed Grimoire
				{ 26, 17072 },	-- Blastershot Launcher
				{ 27, 17103 },	-- Azuresong Mageblade
				{ 28, 18822 },	-- Obsidian Edged Blade
				{ 29, 18842 },	-- Staff of Dominance
			},
		},
		{ -- MCSulfuron
			name = AL["Sulfuron Harbinger"],
			npcID = 12098,
			Level = 999,
			DisplayIDs = {{13030},{12030}},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  16816 }, -- Mantle of Prophecy
				{ 2,  16823 }, -- Nightslayer Shoulder Pads
				{ 3,  16848 }, -- Giantstalker's Epaulets
				{ 4,  16868 }, -- Pauldrons of Might
				{ 16, 18870 }, -- Helm of the Lifegiver
				{ 17, 19145 }, -- Robe of Volatile Power
				{ 18, 19146 }, -- Wristguards of Stability
				{ 19, 18872 }, -- Manastorm Leggings
				{ 20, 18875 }, -- Salamander Scale Pants
				{ 21, 18861 }, -- Flamewaker Legplates
				{ 22, 18879 }, -- Heavy Dark Iron Ring
				{ 23, 19147 }, -- Ring of Spell Power
				{ 24, 17077 }, -- Crimson Shocker
				{ 25, 18878 }, -- Sorcerous Dagger
				{ 26, 17074 }, -- Shadowstrike
			},
		},
		{ -- MCMajordomo
			name = AL["Majordomo Executus"],
			npcID = 12018,
			Level = 999,
			ObjectID = 179703,
			DisplayIDs = {{12029},{13029},{12002}},
			AtlasMapBossID = 9,
			[NORMAL_DIFF] = {
				{ 1,  19139 }, -- Fireguard Shoulders
				{ 2,  18810 }, -- Wild Growth Spaulders
				{ 3,  18811 }, -- Fireproof Cloak
				{ 4,  18808 }, -- Gloves of the Hypnotic Flame
				{ 5,  18809 }, -- Sash of Whispered Secrets
				{ 6,  18812 }, -- Wristguards of True Flight
				{ 7,  18806 }, -- Core Forged Greaves
				{ 8,  19140 }, -- Cauterizing Band
				{ 9,  18805 }, -- Core Hound Tooth
				{ 10, 18803 }, -- Finkle's Lava Dredger
				{ 16, 18703 }, -- Ancient Petrified Leaf
				{ 18, 18646 }, -- The Eye of Divinity
			},
		},
		{ -- MCRagnaros
			name = AL["Ragnaros"],
			npcID = 11502,
			Level = 999,
			DisplayIDs = {{11121}},
			AtlasMapBossID = 10,
			[NORMAL_DIFF] = {
				{ 1, 17204 }, -- Eye of Sulfuras
				{ 2, 19017 }, -- Essence of the Firelord
				{ 4,  16922 }, -- Leggings of Transcendence
				{ 5,  16915 }, -- Netherwind Pants
				{ 6,  16930 }, -- Nemesis Leggings
				{ 7,  16909 }, -- Bloodfang Pants
				{ 8,  16901 }, -- Stormrage Legguards
				{ 9,  16938 }, -- Dragonstalker's Legguards
				{ 10,  16946 }, -- Legplates of Ten Storms
				{ 11,  16954 }, -- Judgement Legplates
				{ 12,  16962 }, -- Legplates of Wrath
				{ 14, 17082 }, -- Shard of the Flame
				{ 16, 18817 }, -- Crown of Destruction
				{ 17, 18814 }, -- Choker of the Fire Lord
				{ 18, 17102 }, -- Cloak of the Shrouded Mists
				{ 19, 17107 }, -- Dragon's Blood Cape
				{ 20, 19137 }, -- Onslaught Girdle
				{ 21, 17063 }, -- Band of Accuria
				{ 22, 19138 }, -- Band of Sulfuras
				{ 23, 18815 }, -- Essence of the Pure Flame
				{ 24, 17106 }, -- Malistar's Defender
				{ 25, 18816 }, -- Perdition's Blade
				{ 26, 17104 }, -- Spinal Reaper
				{ 27, 17076 }, -- Bonereaver's Edge
			},
		},
		{ -- MCRANDOMBOSSDROPS
			name = AL["All bosses"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  18264 }, -- Plans: Elemental Sharpening Stone
				{ 3,  18292 }, -- Schematic: Core Marksman Rifle
				{ 4,  18291 }, -- Schematic: Force Reactive Disk
				{ 5, 18290 }, -- Schematic: Biznicks 247x128 Accurascope
				{ 7, 18259 }, -- Formula: Enchant Weapon - Spell Power
				{ 8, 18260 }, -- Formula: Enchant Weapon - Healing Power
				{ 16, 18252 }, -- Pattern: Core Armor Kit
				{ 18, 18265 }, -- Pattern: Flarecore Wraps
				{ 19, 21371 }, -- Pattern: Core Felcloth Bag
				{ 21, 18257 }, -- Recipe: Major Rejuvenation Potion
			},
		},
		{ -- MCTrashMobs
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  16817 }, -- Girdle of Prophecy
				{ 2,  16802 }, -- Arcanist Belt
				{ 3,  16806 }, -- Felheart Belt
				{ 4,  16827 }, -- Nightslayer Belt
				{ 5,  16828 }, -- Cenarion Belt
				{ 6,  16851 }, -- Giantstalker's Belt
				{ 7,  16838 }, -- Earthfury Belt
				{ 8,  16858 }, -- Lawbringer Belt
				{ 9,  16864 }, -- Belt of Might
				{ 12, 17011 }, -- Lava Core
				{ 13, 17010 }, -- Fiery Core
				{ 14, 11382 }, -- Blood of the Mountain
				{ 15, 17012 }, -- Core Leather
				{ 16, 16819 }, -- Vambraces of Prophecy
				{ 17, 16799 }, -- Arcanist Bindings
				{ 18, 16804 }, -- Felheart Bracers
				{ 19, 16825 }, -- Nightslayer Bracelets
				{ 20, 16830 }, -- Cenarion Bracers
				{ 21, 16850 }, -- Giantstalker's Bracers
				{ 22, 16840 }, -- Earthfury Bracers
				{ 23, 16857 }, -- Lawbringer Bracers
				{ 24, 16861 }, -- Bracers of Might
			},
		},
		T1_SET,
	}
}

data["Onyxia"] = {
	name = AL["Onyxia's Lair"],
	ContentType = RAID40_CONTENT,
	LoadDifficulty = RAID40_DIFF,
	items = {
		{ -- Onyxia
			name = AL["Onyxia"],
			npcID = 10184,
			Level = 999,
			DisplayIDs = {{8570}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  16921 }, -- Halo of Transcendence
				{ 2,  16914 }, -- Netherwind Crown
				{ 3,  16929 }, -- Nemesis Skullcap
				{ 4,  16908 }, -- Bloodfang Hood
				{ 5,  16900 }, -- Stormrage Cover
				{ 6,  16939 }, -- Dragonstalker's Helm
				{ 7,  16947 }, -- Helmet of Ten Storms
				{ 8,  16955 }, -- Judgement Crown
				{ 9,  16963 }, -- Helm of Wrath
				{ 11, 18423 }, -- Head of Onyxia
				{ 12, 15410 }, -- Scale of Onyxia
				{ 16, 18705 }, -- Mature Black Dragon Sinew
				{ 18, 18205 }, -- Eskhandar's Collar
				{ 19, 17078 }, -- Sapphiron Drape
				{ 20, 18813 }, -- Ring of Binding
				{ 21, 17064 }, -- Shard of the Scale
				{ 22, 17067 }, -- Ancient Cornerstone Grimoire
				{ 23, 17068 }, -- Deathbringer
				{ 24, 17075 }, -- Vis'kag the Bloodletter
				{ 26, 17966 }, -- Onyxia Hide Backpack
				{ 27, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
	},
}

data["Zul'Gurub"] = {
	name = AL["Zul'Gurub"],
	ContentType = RAID20_CONTENT,
	LoadDifficulty = RAID20_DIFF,
	ContentPhase = 4,
	items = {
		{ -- ZGJeklik
			name = AL["High Priestess Jeklik"],
			npcID = 14517,
			Level = 999,
			DisplayIDs = {{15219}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 16, 19918 }, -- Jeklik's Crusher
				{ 18, 19923 }, -- Jeklik's Opaline Talisman
				{ 19, 19928 }, -- Animist's Spaulders
				{ 20, 20262 }, -- Seafury Boots
				{ 21, 20265 }, -- Peacekeeper Boots
				{ 22, 19920 }, -- Primalist's Band
				{ 23, 19915 }, -- Zulian Defender
			},
		},
		{ -- ZGVenoxis
			name = AL["High Priest Venoxis"],
			npcID = 14507,
			Level = 999,
			DisplayIDs = {{15217}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 16, 19904 }, -- Runed Bloodstained Hauberk
				{ 17, 19903 }, -- Fang of Venoxis
				{ 19, 19907 }, -- Zulian Tigerhide Cloak
				{ 20, 19906 }, -- Blooddrenched Footpads
				{ 21, 19905 }, -- Zanzil's Band
				{ 22, 19900 }, -- Zulian Stone Axe
			},
		},
		{ -- ZGMarli
			name = AL["High Priestess Mar'li"],
			npcID = 14510,
			Level = 999,
			DisplayIDs = {{15220}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 16, 20032 }, -- Flowing Ritual Robes
				{ 17, 19927 }, -- Mar'li's Touch
				{ 19, 19871 }, -- Talisman of Protection
				{ 20, 19919 }, -- Bloodstained Greaves
				{ 21, 19925 }, -- Band of Jin
				{ 22, 19930 }, -- Mar'li's Eye
			},
		},
		{ -- ZGMandokir
			name = AL["Bloodlord Mandokir"],
			npcID = 11382,
			Level = 999,
			DisplayIDs = {{11288}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 11, 22637 }, -- Primal Hakkari Idol
				{ 16, 19872 }, -- Swift Razzashi Raptor
				{ 17, 20038 }, -- Mandokir's Sting
				{ 18, 19867 }, -- Bloodlord's Defender
				{ 19, 19866 }, -- Warblade of the Hakkari
				{ 20, 19874 }, -- Halberd of Smiting
				{ 22, 19878 }, -- Bloodsoaked Pauldrons
				{ 23, 19870 }, -- Hakkari Loa Cloak
				{ 24, 19869 }, -- Blooddrenched Grips
				{ 25, 19895 }, -- Bloodtinged Kilt
				{ 26, 19877 }, -- Animist's Leggings
				{ 27, 19873 }, -- Overlord's Crimson Band
				{ 28, 19863 }, -- Primalist's Seal
				{ 29, 19893 }, -- Zanzil's Seal
			},
		},
		{ -- ZGGrilek
			name = AL["Gri'lek"],
			npcID = 15082,
			Level = 999,
			DisplayIDs = {{8390}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  19961 }, -- Gri'lek's Grinder
				{ 2,  19962 }, -- Gri'lek's Carver
				{ 4,  19939 }, -- Gri'lek's Blood
			},
		},
		{ -- ZGHazzarah
			name = AL["Hazza'rah"],
			npcID = 15083,
			Level = 999,
			DisplayIDs = {{15267}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  19967 }, -- Thoughtblighter
				{ 2,  19968 }, -- Fiery Retributer
				{ 4,  19942 }, -- Hazza'rah's Dream Thread
			},
		},
		{ -- ZGRenataki
			name = AL["Renataki"],
			npcID = 15084,
			Level = 999,
			DisplayIDs = {{15268}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  19964 }, -- Renataki's Soul Conduit
				{ 2,  19963 }, -- Pitchfork of Madness
				{ 4,  19940 }, -- Renataki's Tooth
			},
		},
		{ -- ZGWushoolay
			name = AL["Wushoolay"],
			npcID = 15085,
			Level = 999,
			DisplayIDs = {{15269}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  19993 }, -- Hoodoo Hunting Bow
				{ 2,  19965 }, -- Wushoolay's Poker
				{ 4,  19941 }, -- Wushoolay's Mane
			},
		},
		{ -- ZGGahzranka
			name = AL["Gahz'ranka"],
			npcID = 15114,
			Level = 999,
			DisplayIDs = {{15288}},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1,  19945 }, -- Foror's Eyepatch
				{ 2,  19944 }, -- Nat Pagle's Fish Terminator
				{ 4,  19947 }, -- Nat Pagle's Broken Reel
				{ 5,  19946 }, -- Tigule's Harpoon
				{ 7,  22739 }, -- Tome of Polymorph: Turtle
			},
		},
		{ -- ZGThekal
			name = AL["High Priest Thekal"],
			npcID = 14509,
			Level = 999,
			DisplayIDs = {{15216}},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 16, 19902 }, -- Swift Zulian Tiger
				{ 17, 19897 }, -- Betrayer's Boots
				{ 18, 19896 }, -- Thekal's Grasp
				{ 20, 19899 }, -- Ritualistic Legguards
				{ 21, 20260 }, -- Seafury Leggings
				{ 22, 20266 }, -- Peacekeeper Leggings
				{ 23, 19898 }, -- Seal of Jin
				{ 24, 19901 }, -- Zulian Slicer
			},
		},
		{ -- ZGArlokk
			name = AL["High Priestess Arlokk"],
			npcID = 14515,
			Level = 999,
			DisplayIDs = {{15218}},
			AtlasMapBossID = 9,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 16, 19910 }, -- Arlokk's Grasp
				{ 17, 19909 }, -- Will of Arlokk
				{ 19, 19913 }, -- Bloodsoaked Greaves
				{ 20, 19912 }, -- Overlord's Onyx Band
				{ 21, 19922 }, -- Arlokk's Hoodoo Stick
				{ 23, 19914 }, -- Panther Hide Sack
			},
		},
		{ -- ZGJindo
			name = AL["Jin'do the Hexxer"],
			npcID = 11380,
			Level = 999,
			DisplayIDs = {{11311}},
			AtlasMapBossID = 10,
			[NORMAL_DIFF] = {
				{ 1,  19721 }, -- Primal Hakkari Shawl
				{ 2,  19724 }, -- Primal Hakkari Aegis
				{ 3,  19723 }, -- Primal Hakkari Kossack
				{ 4,  19722 }, -- Primal Hakkari Tabard
				{ 5,  19717 }, -- Primal Hakkari Armsplint
				{ 6,  19716 }, -- Primal Hakkari Bindings
				{ 7,  19718 }, -- Primal Hakkari Stanchion
				{ 8,  19719 }, -- Primal Hakkari Girdle
				{ 9,  19720 }, -- Primal Hakkari Sash
				{ 11, 22637 }, -- Primal Hakkari Idol
				{ 16, 19885 }, -- Jin'do's Evil Eye
				{ 17, 19891 }, -- Jin'do's Bag of Whammies
				{ 18, 19890 }, -- Jin'do's Hexxer
				{ 19, 19884 }, -- Jin'do's Judgement
				{ 21, 19886 }, -- The Hexxer's Cover
				{ 22, 19875 }, -- Bloodstained Coif
				{ 23, 19888 }, -- Overlord's Embrace
				{ 24, 19929 }, -- Bloodtinged Gloves
				{ 25, 19894 }, -- Bloodsoaked Gauntlets
				{ 26, 19889 }, -- Blooddrenched Leggings
				{ 27, 19887 }, -- Bloodstained Legplates
				{ 28, 19892 }, -- Animist's Boots
			},
		},
		{ -- ZGHakkar
			name = AL["Hakkar"],
			npcID = 14834,
			Level = 999,
			DisplayIDs = {{15295}},
			AtlasMapBossID = 11,
			[NORMAL_DIFF] = {
				{ 1,  19857 }, -- Cloak of Consumption
				{ 2,  20257, [ATLASLOOT_IT_ALLIANCE] = 20264 }, -- Seafury Gauntlets
				--{ 3,  20264, [ATLASLOOT_IT_HORDE] = 20257 }, -- Peacekeeper Gauntlets
				{ 3,  19855 }, -- Bloodsoaked Legplates
				{ 4,  19876 }, -- Soul Corrupter's Necklace
				{ 5,  19856 }, -- The Eye of Hakkar
				{ 7, 19802 }, -- Heart of Hakkar
				{ 16,  19861 }, -- Touch of Chaos
				{ 17,  19853 }, -- Gurubashi Dwarf Destroyer
				{ 18, 19862 }, -- Aegis of the Blood God
				{ 19, 19864 }, -- Bloodcaller
				{ 20, 19865 }, -- Warblade of the Hakkari
				{ 21, 19866 }, -- Warblade of the Hakkari
				{ 22, 19852 }, -- Ancient Hakkari Manslayer
				{ 23, 19859 }, -- Fang of the Faceless
				{ 24, 19854 }, -- Zin'rokh, Destroyer of Worlds
			},
		},
		{ -- ZGShared
			name = AL["High Priest Shared loot"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  22721 }, -- Band of Servitude
				{ 2,  22722 }, -- Seal of the Gurubashi Berserker
				{ 4,  22720 }, -- Zulian Headdress
				{ 5,  22718 }, -- Blooddrenched Mask
				{ 6,  22711 }, -- Cloak of the Hakkari Worshipers
				{ 7,  22712 }, -- Might of the Tribe
				{ 8,  22715 }, -- Gloves of the Tormented
				{ 9,  22714 }, -- Sacrificial Gauntlets
				{ 10, 22716 }, -- Belt of Untapped Power
				{ 11, 22713 }, -- Zulian Scepter of Rites
			},
		},
		{ -- ZGTrash1
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  20263 }, -- Gurubashi Helm
				{ 2,  20259 }, -- Shadow Panther Hide Gloves
				{ 3,  20261 }, -- Shadow Panther Hide Belt
				{ 4,  19921 }, -- Zulian Hacker
				{ 5,  19908 }, -- Sceptre of Smiting
				{ 16,  20258 }, -- Zulian Ceremonial Staff
				{ 17, 19726 }, -- Bloodvine
				{ 18, 19774 }, -- Souldarite
				{ 19, 19767 }, -- Primal Bat Leather
				{ 20, 19768 }, -- Primal Tiger Leather
				{ 7, 19706 }, -- Bloodscalp Coin
				{ 8, 19701 }, -- Gurubashi Coin
				{ 9, 19700 }, -- Hakkari Coin
				{ 10, 19699 }, -- Razzashi Coin
				{ 11, 19704 }, -- Sandfury Coin
				{ 12, 19705 }, -- Skullsplitter Coin
				{ 13, 19702 }, -- Vilebranch Coin
				{ 14, 19703 }, -- Witherbark Coin
				{ 15, 19698 }, -- Zulian Coin
				{ 22, 19708 }, -- Blue Hakkari Bijou
				{ 23, 19713 }, -- Bronze Hakkari Bijou
				{ 24, 19715 }, -- Gold Hakkari Bijou
				{ 25, 19711 }, -- Green Hakkari Bijou
				{ 26, 19710 }, -- Orange Hakkari Bijou
				{ 27, 19712 }, -- Purple Hakkari Bijou
				{ 28, 19707 }, -- Red Hakkari Bijou
				{ 29, 19714 }, -- Silver Hakkari Bijou
				{ 30, 19709 }, -- Yellow Hakkari Bijou
			},
		},
		{ -- ZGEnchants
			name = AL["Enchants"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  19789 }, -- Prophetic Aura
				{ 2,  19787 }, -- Presence of Sight
				{ 3,  19788 }, -- Hoodoo Hex
				{ 4,  19784 }, -- Death's Embrace
				{ 5,  19790 }, -- Animist's Caress
				{ 6,  19785 }, -- Falcon's Call
				{ 7,  19786 }, -- Vodouisant's Vigilant Embrace
				{ 8,  19783 }, -- Syncretist's Sigil
				{ 9,  19782 }, -- Presence of Might
				{ 16, 20077 }, -- Zandalar Signet of Might
				{ 17, 20076 }, -- Zandalar Signet of Mojo
				{ 18, 20078 }, -- Zandalar Signet of Serenity
				{ 20, 22635 }, -- Savage Guard
			},
		},
		{ -- ZGMuddyChurningWaters
			name = AL["Muddy Churning Waters"],
			ExtraList = true,
			AtlasMapBossID = "1'",
			[NORMAL_DIFF] = {
				{ 1,  19975 }, -- Zulian Mudskunk
			},
		},
		{ -- ZGJinxedHoodooPile
			name = AL["Jinxed Hoodoo Pile"],
			ExtraList = true,
			AtlasMapBossID = "2'",
			[NORMAL_DIFF] = {
				{ 1,  19727 }, -- Blood Scythe
				{ 3,  19820 }, -- Punctured Voodoo Doll
				{ 4,  19818 }, -- Punctured Voodoo Doll
				{ 5,  19819 }, -- Punctured Voodoo Doll
				{ 6,  19814 }, -- Punctured Voodoo Doll
				{ 7,  19821 }, -- Punctured Voodoo Doll
				{ 8,  19816 }, -- Punctured Voodoo Doll
				{ 9,  19817 }, -- Punctured Voodoo Doll
				{ 10, 19815 }, -- Punctured Voodoo Doll
				{ 11, 19813 }, -- Punctured Voodoo Doll
			},
		},
	},
}

data["BlackwingLair"] = {
	name = AL["Blackwing Lair"],
	ContentType = RAID40_CONTENT,
	LoadDifficulty = RAID40_DIFF,
	ContentPhase = 3,
	items = {
		{ -- BWLRazorgore
			name = AL["Razorgore the Untamed"],
			npcID = 12435,
			Level = 999,
			DisplayIDs = {{10115}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  16926 }, -- Bindings of Transcendence
				{ 2,  16918 }, -- Netherwind Bindings
				{ 3,  16934 }, -- Nemesis Bracers
				{ 4,  16911 }, -- Bloodfang Bracers
				{ 5,  16904 }, -- Stormrage Bracers
				{ 6,  16935 }, -- Dragonstalker's Bracers
				{ 7,  16943 }, -- Bracers of Ten Storms
				{ 8,  16951 }, -- Judgement Bindings
				{ 9,  16959 }, -- Bracelets of Wrath
				{ 16, 19336 }, -- Arcane Infused Gem
				{ 17, 19337 }, -- The Black Book
				{ 19, 19370 }, -- Mantle of the Blackwing Cabal
				{ 20, 19369 }, -- Gloves of Rapid Evolution
				{ 21, 19335 }, -- Spineshatter
				{ 22, 19334 }, -- The Untamed Blade
			},
		},
		{ -- BWLVaelastrasz
			name = AL["Vaelastrasz the Corrupt"],
			npcID = 13020,
			Level = 999,
			DisplayIDs = {{13992}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  16925 }, -- Belt of Transcendence
				{ 2,  16818 }, -- Netherwind Belt
				{ 3,  16933 }, -- Nemesis Belt
				{ 4,  16910 }, -- Bloodfang Belt
				{ 5,  16903 }, -- Stormrage Belt
				{ 6,  16936 }, -- Dragonstalker's Belt
				{ 7,  16944 }, -- Belt of Ten Storms
				{ 8,  16952 }, -- Judgement Belt
				{ 9,  16960 }, -- Waistband of Wrath
				{ 16, 19339 }, -- Mind Quickening Gem
				{ 17, 19340 }, -- Rune of Metamorphosis
				{ 19, 19372 }, -- Helm of Endless Rage
				{ 20, 19371 }, -- Pendant of the Fallen Dragon
				{ 21, 19348 }, -- Red Dragonscale Protector
				{ 22, 19346 }, -- Dragonfang Blade
			},
		},
		{ -- BWLLashlayer
			name = AL["Broodlord Lashlayer"],
			npcID = 12017,
			Level = 999,
			DisplayIDs = {{14308}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  16919 }, -- Boots of Transcendence
				{ 2,  16912 }, -- Netherwind Boots
				{ 3,  16927 }, -- Nemesis Boots
				{ 4,  16906 }, -- Bloodfang Boots
				{ 5,  16898 }, -- Stormrage Boots
				{ 6,  16941 }, -- Dragonstalker's Greaves
				{ 7,  16949 }, -- Greaves of Ten Storms
				{ 8,  16957 }, -- Judgement Sabatons
				{ 9,  16965 }, -- Sabatons of Wrath
				{ 16, 19341 }, -- Lifegiving Gem
				{ 17, 19342 }, -- Venomous Totem
				{ 19, 19373 }, -- Black Brood Pauldrons
				{ 20, 19374 }, -- Bracers of Arcane Accuracy
				{ 21, 19350 }, -- Heartstriker
				{ 22, 19351 }, -- Maladath, Runed Blade of the Black Flight
				{ 24, 20383 }, -- Head of the Broodlord Lashlayer
			},
		},
		{ -- BWLFiremaw
			name = AL["Firemaw"],
			npcID = 11983,
			Level = 999,
			DisplayIDs = {{6377}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  16920 }, -- Handguards of Transcendence
				{ 2,  16913 }, -- Netherwind Gloves
				{ 3,  16928 }, -- Nemesis Gloves
				{ 4,  16907 }, -- Bloodfang Gloves
				{ 5,  16899 }, -- Stormrage Handguards
				{ 6,  16940 }, -- Dragonstalker's Gauntlets
				{ 7,  16948 }, -- Gauntlets of Ten Storms
				{ 8,  16956 }, -- Judgement Gauntlets
				{ 9,  16964 }, -- Gauntlets of Wrath
				{ 13, 19344 }, -- Natural Alignment Crystal
				{ 14, 19343 }, -- Scrolls of Blinding Light
				{ 16, 19394 }, -- Drake Talon Pauldrons
				{ 17, 19398 }, -- Cloak of Firemaw
				{ 18, 19399 }, -- Black Ash Robe
				{ 19, 19400 }, -- Firemaw's Clutch
				{ 20, 19396 }, -- Taut Dragonhide Belt
				{ 21, 19401 }, -- Primalist's Linked Legguards
				{ 22, 19402 }, -- Legguards of the Fallen Crusader
				{ 24, 19365 }, -- Claw of the Black Drake
				{ 25, 19353 }, -- Drake Talon Cleaver
				{ 26, 19355 }, -- Shadow Wing Focus Staff
				{ 28, 19397 }, -- Ring of Blackrock
				{ 29, 19395 }, -- Rejuvenating Gem
			},
		},
		{ -- BWLEbonroc
			name = AL["Ebonroc"],
			npcID = 14601,
			Level = 999,
			DisplayIDs = {{6377}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  16920 }, -- Handguards of Transcendence
				{ 2,  16913 }, -- Netherwind Gloves
				{ 3,  16928 }, -- Nemesis Gloves
				{ 4,  16907 }, -- Bloodfang Gloves
				{ 5,  16899 }, -- Stormrage Handguards
				{ 6,  16940 }, -- Dragonstalker's Gauntlets
				{ 7,  16948 }, -- Gauntlets of Ten Storms
				{ 8,  16956 }, -- Judgement Gauntlets
				{ 9,  16964 }, -- Gauntlets of Wrath
				{ 11, 19345 }, -- Aegis of Preservation
				{ 12, 19406 }, -- Drake Fang Talisman
				{ 13, 19395 }, -- Rejuvenating Gem
				{ 16, 19394 }, -- Drake Talon Pauldrons
				{ 17, 19407 }, -- Ebony Flame Gloves
				{ 18, 19396 }, -- Taut Dragonhide Belt
				{ 19, 19405 }, -- Malfurion's Blessed Bulwark
				{ 21, 19368 }, -- Dragonbreath Hand Cannon
				{ 22, 19353 }, -- Drake Talon Cleaver
				{ 23, 19355 }, -- Shadow Wing Focus Staff
				{ 26, 19403 }, -- Band of Forced Concentration
				{ 27, 19397 }, -- Ring of Blackrock

			},
		},
		{ -- BWLFlamegor
			name = AL["Flamegor"],
			npcID = 11981,
			Level = 999,
			DisplayIDs = {{6377}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  16920 }, -- Handguards of Transcendence
				{ 2,  16913 }, -- Netherwind Gloves
				{ 3,  16928 }, -- Nemesis Gloves
				{ 4,  16907 }, -- Bloodfang Gloves
				{ 5,  16899 }, -- Stormrage Handguards
				{ 6,  16940 }, -- Dragonstalker's Gauntlets
				{ 7,  16948 }, -- Gauntlets of Ten Storms
				{ 8,  16956 }, -- Judgement Gauntlets
				{ 9,  16964 }, -- Gauntlets of Wrath
				{ 11, 19395 }, -- Rejuvenating Gem
				{ 12, 19431 }, -- Styleen's Impeding Scarab
				{ 16, 19394 }, -- Drake Talon Pauldrons
				{ 17, 19430 }, -- Shroud of Pure Thought
				{ 18, 19396 }, -- Taut Dragonhide Belt
				{ 19, 19433 }, -- Emberweave Leggings
				{ 21, 19367 }, -- Dragon's Touch
				{ 22, 19353 }, -- Drake Talon Cleaver
				{ 23, 19357 }, -- Herald of Woe
				{ 24, 19355 }, -- Shadow Wing Focus Staff
				{ 26, 19432 }, -- Circle of Applied Force
				{ 27, 19397 }, -- Ring of Blackrock
			},
		},
		{ -- BWLChromaggus
			name = AL["Chromaggus"],
			npcID = 14020,
			Level = 999,
			DisplayIDs = {{14367}},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1,  16924 }, -- Pauldrons of Transcendence
				{ 2,  16917 }, -- Netherwind Mantle
				{ 3,  16932 }, -- Nemesis Spaulders
				{ 4,  16832 }, -- Bloodfang Spaulders
				{ 5,  16902 }, -- Stormrage Pauldrons
				{ 6,  16937 }, -- Dragonstalker's Spaulders
				{ 7,  16945 }, -- Epaulets of Ten Storms
				{ 8,  16953 }, -- Judgement Spaulders
				{ 9,  16961 }, -- Pauldrons of Wrath
				{ 16, 19389 }, -- Taut Dragonhide Shoulderpads
				{ 17, 19386 }, -- Elementium Threaded Cloak
				{ 18, 19390 }, -- Taut Dragonhide Gloves
				{ 19, 19388 }, -- Angelista's Grasp
				{ 20, 19393 }, -- Primalist's Linked Waistguard
				{ 21, 19392 }, -- Girdle of the Fallen Crusader
				{ 22, 19385 }, -- Empowered Leggings
				{ 23, 19391 }, -- Shimmering Geta
				{ 24, 19387 }, -- Chromatic Boots
				{ 26, 19361 }, -- Ashjre'thul, Crossbow of Smiting
				{ 27, 19349 }, -- Elementium Reinforced Bulwark
				{ 28, 19347 }, -- Claw of Chromaggus
				{ 29, 19352 }, -- Chromatically Tempered Sword
			},
		},
		{ -- BWLNefarian
			name = AL["Nefarian"],
			npcID = 11583,
			Level = 999,
			DisplayIDs = {{11380}},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  16923 }, -- Robes of Transcendence
				{ 2,  16916 }, -- Netherwind Robes
				{ 3,  16931 }, -- Nemesis Robes
				{ 4,  16905 }, -- Bloodfang Chestpiece
				{ 5,  16897 }, -- Stormrage Chestguard
				{ 6,  16942 }, -- Dragonstalker's Breastplate
				{ 7,  16950 }, -- Breastplate of Ten Storms
				{ 8,  16958 }, -- Judgement Breastplate
				{ 9,  16966 }, -- Breastplate of Wrath
				{ 11, 19003 }, -- Head of Nefarian
				{ 16, 19360 }, -- Lok'amir il Romathis
				{ 17, 19363 }, -- Crul'shorukh, Edge of Chaos
				{ 18, 19364 }, -- Ashkandi, Greatsword of the Brotherhood
				{ 19, 19356 }, -- Staff of the Shadow Flame
				{ 21, 19375 }, -- Mish'undare, Circlet of the Mind Flayer
				{ 22, 19377 }, -- Prestor's Talisman of Connivery
				{ 23, 19378 }, -- Cloak of the Brood Lord
				{ 24, 19380 }, -- Therazane's Link
				{ 25, 19381 }, -- Boots of the Shadow Flame
				{ 26, 19376 }, -- Archimtiros' Ring of Reckoning
				{ 27, 19382 }, -- Pure Elementium Band
				{ 28, 19379 }, -- Neltharion's Tear
				{ 30, 11938 }, -- Sack of Gems
				-- Hidden items
				{ 0, 17962 }, -- Blue Sack of Gems
				{ 0, 17963 }, -- Green Sack of Gems
				{ 0, 17964 }, -- Gray Sack of Gems
				{ 0, 17965 }, -- Yellow Sack of Gems
				{ 0, 17969 }, -- Red Sack of Gems
			},
		},
		{ -- BWLTrashMobs
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  19436 }, -- Cloak of Draconic Might
				{ 2,  19439 }, -- Interlaced Shadow Jerkin
				{ 3,  19437 }, -- Boots of Pure Thought
				{ 4,  19438 }, -- Ringo's Blizzard Boots
				{ 5,  19434 }, -- Band of Dark Dominion
				{ 6,  19435 }, -- Essence Gatherer
				{ 7,  19362 }, -- Doom's Edge
				{ 8,  19354 }, -- Draconic Avenger
				{ 9,  19358 }, -- Draconic Maul
				{ 11, 18562 }, -- Elementium Ore
			},
		},
		T2_SET,
	},
}

data["TheRuinsofAhnQiraj"] = { -- AQ20
	name = AL["Ruins of Ahn'Qiraj"],
	ContentType = RAID20_CONTENT,
	LoadDifficulty = RAID20_DIFF,
	ContentPhase = 5,
	items = {
		{ -- AQ20Kurinnaxx
			name = AL["Kurinnaxx"],
			npcID = 15348,
			Level = 999,
			DisplayIDs = {{15742}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  21499 }, -- Vestments of the Shifting Sands
				{ 2,  21498 }, -- Qiraji Sacrificial Dagger
				{ 4,  21502 }, -- Sand Reaver Wristguards
				{ 5,  21501 }, -- Toughened Silithid Hide Gloves
				{ 6,  21500 }, -- Belt of the Inquisition
				{ 7,  21503 }, -- Belt of the Sand Reaver
				{ 19, 20885 }, -- Qiraji Martial Drape
				{ 20, 20889 }, -- Qiraji Regal Drape
				{ 21, 20888 }, -- Qiraji Ceremonial Ring
				{ 22, 20884 }, -- Qiraji Magisterial Ring
			},
		},
		{ -- AQ20Rajaxx
			name = AL["General Rajaxx"],
			npcID = 15341,
			Level = 999,
			DisplayIDs = {{15376}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  21493 }, -- Boots of the Vanguard
				{ 2,  21492 }, -- Manslayer of the Qiraji
				{ 4,  21496 }, -- Bracers of Qiraji Command
				{ 5,  21494 }, -- Southwind's Grasp
				{ 6,  21495 }, -- Legplates of the Qiraji Command
				{ 7,  21497 }, -- Boots of the Qiraji General
				{ 9,  "INV_Box_01", nil, AL["Trash"] },
				{ 10,  21810 }, -- Treads of the Wandering Nomad
				{ 11,  21809 }, -- Fury of the Forgotten Swarm
				{ 12,  21806 }, -- Gavel of Qiraji Authority
				{ 19, 20885 }, -- Qiraji Martial Drape
				{ 20, 20889 }, -- Qiraji Regal Drape
				{ 21, 20888 }, -- Qiraji Ceremonial Ring
				{ 22, 20884 }, -- Qiraji Magisterial Ring
			},
		},
		{ -- AQ20Moam
			name = AL["Moam"],
			npcID = 15340,
			Level = 999,
			DisplayIDs = {{15392}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  21472 }, -- Dustwind Turban
				{ 2,  21467 }, -- Thick Silithid Chestguard
				{ 3,  21479 }, -- Gauntlets of the Immovable
				{ 4,  21471 }, -- Talon of Furious Concentration
				{ 6,  21455 }, -- Southwind Helm
				{ 7,  21468 }, -- Mantle of Maz'Nadir
				{ 8,  21474 }, -- Chitinous Shoulderguards
				{ 9,  21470 }, -- Cloak of the Savior
				{ 10, 21469 }, -- Gauntlets of Southwind
				{ 11, 21476 }, -- Obsidian Scaled Leggings
				{ 12, 21475 }, -- Legplates of the Destroyer
				{ 13, 21477 }, -- Ring of Fury
				{ 14, 21473 }, -- Eye of Moam
				{ 16, 20890 }, -- Qiraji Ornate Hilt
				{ 17, 20886 }, -- Qiraji Spiked Hilt
				{ 21, 20888 }, -- Qiraji Ceremonial Ring
				{ 22, 20884 }, -- Qiraji Magisterial Ring
				{ 24, 22220 }, -- Plans: Black Grasp of the Destroyer
				--{ 24, 22194 }, -- Black Grasp of the Destroyer
			},
		},
		{ -- AQ20Buru
			name = AL["Buru the Gorger"],
			npcID = 15370,
			Level = 999,
			DisplayIDs = {{15654}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  21487, [ATLASLOOT_IT_ALLIANCE] = 21486 }, -- Slimy Scaled Gauntlets
				--{ 2,  21486 }, -- Gloves of the Swarm
				{ 2,  21485 }, -- Buru's Skull Fragment
				{ 5,  21491 }, -- Scaled Bracers of the Gorger
				{ 6,  21489 }, -- Quicksand Waders
				{ 7,  21490 }, -- Slime Kickers
				{ 8,  21488 }, -- Fetish of Chitinous Spikes
				{ 16, 20890 }, -- Qiraji Ornate Hilt
				{ 17, 20886 }, -- Qiraji Spiked Hilt
				{ 20, 20885 }, -- Qiraji Martial Drape
				{ 21, 20889 }, -- Qiraji Regal Drape
				{ 22, 20888 }, -- Qiraji Ceremonial Ring
				{ 23, 20884 }, -- Qiraji Magisterial Ring
			},
		},
		{ -- AQ20Ayamiss
			name = AL["Ayamiss the Hunter"],
			npcID = 15369,
			Level = 999,
			DisplayIDs = {{15431}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  21479 }, -- Gauntlets of the Immovable
				{ 2,  21478 }, -- Bow of Taut Sinew
				{ 3,  21466 }, -- Stinger of Ayamiss
				{ 5,  21484 }, -- Helm of Regrowth
				{ 6,  21480 }, -- Scaled Silithid Gauntlets
				{ 7,  21482 }, -- Boots of the Fiery Sands
				{ 8,  21481 }, -- Boots of the Desert Protector
				{ 9,  21483 }, -- Ring of the Desert Winds
				{ 16, 20890 }, -- Qiraji Ornate Hilt
				{ 17, 20886 }, -- Qiraji Spiked Hilt
				{ 20, 20885 }, -- Qiraji Martial Drape
				{ 21, 20889 }, -- Qiraji Regal Drape
				{ 22, 20888 }, -- Qiraji Ceremonial Ring
				{ 23, 20884 }, -- Qiraji Magisterial Ring
			},
		},
		{ -- AQ20Ossirian
			name = AL["Ossirian the Unscarred"],
			npcID = 15339,
			Level = 999,
			DisplayIDs = {{15432}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  21460 }, -- Helm of Domination
				{ 2,  21454, [ATLASLOOT_IT_ALLIANCE] = 21453 }, -- Runic Stone Shoulders
				--{ 3,  21453 }, -- Mantle of the Horusath
				{ 3,  21456 }, -- Sandstorm Cloak
				{ 4,  21464 }, -- Shackles of the Unscarred
				{ 5,  21457 }, -- Bracers of Brutality
				{ 6,  21462 }, -- Gloves of Dark Wisdom
				{ 7,  21458 }, -- Gauntlets of New Life
				{ 8,  21463 }, -- Ossirian's Binding
				{ 9, 21461 }, -- Leggings of the Black Blizzard
				{ 10, 21459 }, -- Crossbow of Imminent Doom
				{ 11, 21715 }, -- Sand Polished Hammer
				{ 12, 21452 }, -- Staff of the Ruins
				{ 16, 20890 }, -- Qiraji Ornate Hilt
				{ 17, 20886 }, -- Qiraji Spiked Hilt
				{ 20, 20888 }, -- Qiraji Ceremonial Ring
				{ 21, 20884 }, -- Qiraji Magisterial Ring
				{ 23, 21220 }, -- Head of Ossirian the Unscarred
			},
		},
		{ -- AQ20Trash
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  21804, [ATLASLOOT_IT_ALLIANCE] = 21803 }, -- Coif of Elemental Fury
				--{ 2,  21803 }, -- Helm of the Holy Avenger
				{ 2,  21805 }, -- Polished Obsidian Pauldrons
				{ 5,  20873 }, -- Alabaster Idol
				{ 6,  20869 }, -- Amber Idol
				{ 7,  20866 }, -- Azure Idol
				{ 8,  20870 }, -- Jasper Idol
				{ 9,  20868 }, -- Lambent Idol
				{ 10, 20871 }, -- Obsidian Idol
				{ 11, 20867 }, -- Onyx Idol
				{ 12, 20872 }, -- Vermillion Idol
				{ 14, 21761 }, -- Scarab Coffer Key
				{ 15, 21156 }, -- Scarab Bag
				{ 16, 21801 }, -- Antenna of Invigoration
				{ 17, 21800 }, -- Silithid Husked Launcher
				{ 18, 21802 }, -- The Lost Kris of Zedd
				{ 20, 20864 }, -- Bone Scarab
				{ 21, 20861 }, -- Bronze Scarab
				{ 22, 20863 }, -- Clay Scarab
				{ 23, 20862 }, -- Crystal Scarab
				{ 24, 20859 }, -- Gold Scarab
				{ 25, 20865 }, -- Ivory Scarab
				{ 26, 20860 }, -- Silver Scarab
				{ 27, 20858 }, -- Stone Scarab
				{ 29, 22203 }, -- Large Obsidian Shard
				{ 30, 22202 }, -- Small Obsidian Shard
			},
		},
		{ -- AQ20ClassBooks
			name = AL["Class books"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  21284 }, -- Codex of Greater Heal V
				{ 2,  21287 }, -- Codex of Prayer of Healing V
				{ 3,  21285 }, -- Codex of Renew X
				{ 4,  21279 }, -- Tome of Fireball XII
				{ 5,  21214 }, -- Tome of Frostbolt XI
				{ 6,  21280 }, -- Tome of Arcane Missiles VIII
				{ 7,  21281 }, -- Grimoire of Shadow Bolt X
				{ 8,  21283 }, -- Grimoire of Corruption VII
				{ 9,  21282 }, -- Grimoire of Immolate VIII
				{ 10, 21300 }, -- Handbook of Backstab IX
				{ 11, 21303 }, -- Handbook of Feint V
				{ 12, 21302 }, -- Handbook of Deadly Poison V
				{ 13, 21294 }, -- Book of Healing Touch XI
				{ 14, 21296 }, -- Book of Rejuvenation XI
				{ 15, 21295 }, -- Book of Starfire VII
				{ 16, 21306 }, -- Guide: Serpent Sting IX
				{ 17, 21304 }, -- Guide: Multi-Shot V
				{ 18, 21307 }, -- Guide: Aspect of the Hawk VII
				{ 19, 21291 }, -- Tablet of Healing Wave X
				{ 20, 21292 }, -- Tablet of Strength of Earth Totem V
				{ 21, 21293 }, -- Tablet of Grace of Air Totem III
				{ 22, 21288 }, -- Libram: Blessing of Wisdom VI
				{ 23, 21289 }, -- Libram: Blessing of Might VII
				{ 24, 21290 }, -- Libram: Holy Light IX
				{ 25, 21298 }, -- Manual of Battle Shout VII
				{ 26, 21299 }, -- Manual of Revenge VI
				{ 27, 21297 }, -- Manual of Heroic Strike IX
			},
		},
		AQ_SCARABS,
		AQ_ENCHANTS,
		AQ_OPENING,
	},
}

data["TheTempleofAhnQiraj"] = { -- AQ40
	name = AL["Ahn'Qiraj"],
	ContentType = RAID40_CONTENT,
	LoadDifficulty = RAID40_DIFF,
	ContentPhase = 5,
	items = {
		{ -- AQ40Skeram
			name = AL["The Prophet Skeram"],
			npcID = 15263,
			Level = 999,
			DisplayIDs = {{15345}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  21699 }, -- Barrage Shoulders
				{ 2,  21814 }, -- Breastplate of Annihilation
				{ 3,  21708 }, -- Beetle Scaled Wristguards
				{ 4,  21698 }, -- Leggings of Immersion
				{ 5,  21705 }, -- Boots of the Fallen Prophet
				{ 6,  21704 }, -- Boots of the Redeemed Prophecy
				{ 7,  21706 }, -- Boots of the Unwavering Will
				{ 9,  21702 }, -- Amulet of Foul Warding
				{ 10, 21700 }, -- Pendant of the Qiraji Guardian
				{ 11, 21701 }, -- Cloak of Concentrated Hatred
				{ 12, 21707 }, -- Ring of Swarming Thought
				{ 13, 21703 }, -- Hammer of Ji'zhi
				{ 14, 21128 }, -- Staff of the Qiraji Prophets
				{ 16, 21237 }, -- Imperial Qiraji Regalia
				{ 17, 21232 }, -- Imperial Qiraji Armaments
				{ 19, 22222 }, -- Plans: Thick Obsidian Breastplate
				--{ 20, 22196 }, -- Thick Obsidian Breastplate
			},
		},
		{ -- AQ40Trio
			name = AL["Bug Trio"],
			npcID = {15543, 15544, 15511},
			Level = 999,
			DisplayIDs = {{15657},{15658},{15656}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  21693 }, -- Guise of the Devourer
				{ 2,  21694 }, -- Ternary Mantle
				{ 3,  21697 }, -- Cape of the Trinity
				{ 4,  21696 }, -- Robes of the Triumvirate
				{ 5,  21692 }, -- Triad Girdle
				{ 6,  21695 }, -- Angelista's Touch
				{ 8,  21237 }, -- Imperial Qiraji Regalia
				{ 9,  21232 }, -- Imperial Qiraji Armaments
				{ 11, "INV_BOX_02", nil, format(AL["%s killed last"], AL["Lord Kri"]) },
				{ 12, 21680 }, -- Vest of Swift Execution
				{ 13, 21681 }, -- Ring of the Devoured
				{ 14, 21685 }, -- Petrified Scarab
				{ 15, 21603 }, -- Wand of Qiraji Nobility
				{ 16, "INV_BOX_02", nil, format(AL["%s killed last"], AL["Vem"]) },
				{ 17, 21690 }, -- Angelista's Charm
				{ 18, 21689 }, -- Gloves of Ebru
				{ 19, 21691 }, -- Ooze-ridden Gauntlets
				{ 20, 21688 }, -- Boots of the Fallen Hero
				{ 22, "INV_BOX_02", nil, format(AL["%s killed last"], AL["Princess Yauj"]) },
				{ 23, 21686 }, -- Mantle of Phrenic Power
				{ 24, 21684 }, -- Mantle of the Desert's Fury
				{ 25, 21683 }, -- Mantle of the Desert Crusade
				{ 26, 21682 }, -- Bile-Covered Gauntlets
				{ 27, 21687 }, -- Ukko's Ring of Darkness
			},
		},
		{ -- AQ40Sartura
			name = AL["Battleguard Sartura"],
			npcID = 15516,
			Level = 999,
			DisplayIDs = {{15583}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  21669 }, -- Creeping Vine Helm
				{ 2,  21678 }, -- Necklace of Purity
				{ 3,  21671 }, -- Robes of the Battleguard
				{ 4,  21672 }, -- Gloves of Enforcement
				{ 5,  21674 }, -- Gauntlets of Steadfast Determination
				{ 6,  21675 }, -- Thick Qirajihide Belt
				{ 7,  21676 }, -- Leggings of the Festering Swarm
				{ 8,  21668 }, -- Scaled Leggings of Qiraji Fury
				{ 9,  21667 }, -- Legplates of Blazing Light
				{ 10, 21648 }, -- Recomposed Boots
				{ 11, 21670 }, -- Badge of the Swarmguard
				{ 12, 21666 }, -- Sartura's Might
				{ 13, 21673 }, -- Silithid Claw
				{ 16, 21237 }, -- Imperial Qiraji Regalia
				{ 17, 21232 }, -- Imperial Qiraji Armaments
			},
		},
		{ -- AQ40Fankriss
			name = AL["Fankriss the Unyielding"],
			npcID = 15510,
			Level = 999,
			DisplayIDs = {{15743}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  21665 }, -- Mantle of Wicked Revenge
				{ 2,  21639 }, -- Pauldrons of the Unrelenting
				{ 3,  21627 }, -- Cloak of Untold Secrets
				{ 4,  21663 }, -- Robes of the Guardian Saint
				{ 5,  21652 }, -- Silithid Carapace Chestguard
				{ 6,  21651 }, -- Scaled Sand Reaver Leggings
				{ 7,  21645 }, -- Hive Tunneler's Boots
				{ 8,  21650 }, -- Ancient Qiraji Ripper
				{ 9,  21635 }, -- Barb of the Sand Reaver
				{ 11, 21664 }, -- Barbed Choker
				{ 12, 21647 }, -- Fetish of the Sand Reaver
				{ 13, 22402 }, -- Libram of Grace
				{ 14, 22396 }, -- Totem of Life
				{ 16, 21237 }, -- Imperial Qiraji Regalia
				{ 17, 21232 }, -- Imperial Qiraji Armaments
			},
		},
		{ -- AQ40Viscidus
			name = AL["Viscidus"],
			npcID = 15299,
			Level = 999,
			DisplayIDs = {{15686}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  21624 }, -- Gauntlets of Kalimdor
				{ 2,  21623 }, -- Gauntlets of the Righteous Champion
				{ 3,  21626 }, -- Slime-coated Leggings
				{ 4,  21622 }, -- Sharpened Silithid Femur
				{ 6,  21677 }, -- Ring of the Qiraji Fury
				{ 7,  21625 }, -- Scarab Brooch
				{ 8,  22399 }, -- Idol of Health
				{ 16, 21237 }, -- Imperial Qiraji Regalia
				{ 17, 21232 }, -- Imperial Qiraji Armaments
				{ 19, 20928 }, -- Qiraji Bindings of Command
				{ 20, 20932 }, -- Qiraji Bindings of Dominance
			},
		},
		{ -- AQ40Huhuran
			name = AL["Princess Huhuran"],
			npcID = 15509,
			Level = 999,
			DisplayIDs = {{15739}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  21621 }, -- Cloak of the Golden Hive
				{ 2,  21618 }, -- Hive Defiler Wristguards
				{ 3,  21619 }, -- Gloves of the Messiah
				{ 4,  21617 }, -- Wasphide Gauntlets
				{ 5,  21620 }, -- Ring of the Martyr
				{ 6,  21616 }, -- Huhuran's Stinger
				{ 16, 21237 }, -- Imperial Qiraji Regalia
				{ 17, 21232 }, -- Imperial Qiraji Armaments
				{ 19, 20928 }, -- Qiraji Bindings of Command
				{ 20, 20932 }, -- Qiraji Bindings of Dominance
			},
		},
		{ -- AQ40Emperors
			name = AL["Twin Emperors"],
			npcID = {15275, 15276},
			Level = 999,
			DisplayIDs = {{15761},{15778}},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1, "INV_Box_01", nil, AL["Emperor Vek'lor"], nil },
				{ 2,  20930 }, -- Vek'lor's Diadem
				{ 3,  21602 }, -- Qiraji Execution Bracers
				{ 4,  21599 }, -- Vek'lor's Gloves of Devastation
				{ 5,  21598 }, -- Royal Qiraji Belt
				{ 6,  21600 }, -- Boots of Epiphany
				{ 7,  21601 }, -- Ring of Emperor Vek'lor
				{ 8,  21597 }, -- Royal Scepter of Vek'lor
				{ 9,  20735 }, -- Formula: Enchant Cloak - Subtlety
				{ 12, 21232 }, -- Imperial Qiraji Armaments
				{ 16, "INV_Box_01", nil, AL["Emperor Vek'nilash"], nil },
				{ 17, 20926 }, -- Vek'nilash's Circlet
				{ 18, 21608 }, -- Amulet of Vek'nilash
				{ 19, 21604 }, -- Bracelets of Royal Redemption
				{ 20, 21605 }, -- Gloves of the Hidden Temple
				{ 21, 21609 }, -- Regenerating Belt of Vek'nilash
				{ 22, 21607 }, -- Grasp of the Fallen Emperor
				{ 23, 21606 }, -- Belt of the Fallen Emperor
				{ 24, 21679 }, -- Kalimdor's Revenge
				{ 25, 20726 }, -- Formula: Enchant Gloves - Threat
				{ 27, 21237 }, -- Imperial Qiraji Regalia
			},
		},
		{ -- AQ40Ouro
			name = AL["Ouro"],
			npcID = 15517,
			Level = 999,
			DisplayIDs = {{15509}},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  21615 }, -- Don Rigoberto's Lost Hat
				{ 2,  21611 }, -- Burrower Bracers
				{ 3,  23558 }, -- The Burrower's Shell
				{ 4,  23570 }, -- Jom Gabbar
				{ 5,  21610 }, -- Wormscale Blocker
				{ 6,  23557 }, -- Larvae of the Great Worm
				{ 16, 21237 }, -- Imperial Qiraji Regalia
				{ 17, 21232 }, -- Imperial Qiraji Armaments
				{ 19,  20927 }, -- Ouro's Intact Hide
				{ 20,  20931 }, -- Skin of the Great Sandworm
			},
		},
		{ -- AQ40CThun
			name = AL["C'Thun"],
			npcID = 15727,
			Level = 999,
			DisplayIDs = {{15787}},
			AtlasMapBossID = 9,
			[NORMAL_DIFF] = {
				{ 1,  22732 }, -- Mark of C'Thun
				{ 2,  21583 }, -- Cloak of Clarity
				{ 3,  22731 }, -- Cloak of the Devoured
				{ 4,  22730 }, -- Eyestalk Waist Cord
				{ 5,  21582 }, -- Grasp of the Old God
				{ 6,  21586 }, -- Belt of Never-ending Agony
				{ 7,  21585 }, -- Dark Storm Gauntlets
				{ 8,  21581 }, -- Gauntlets of Annihilation
				{ 9,  21596 }, -- Ring of the Godslayer
				{ 10, 21579 }, -- Vanquished Tentacle of C'Thun
				{ 11, 21839 }, -- Scepter of the False Prophet
				{ 12, 21126 }, -- Death's Sting
				{ 13, 21134 }, -- Dark Edge of Insanity
				{ 16, 20929 }, -- Carapace of the Old God
				{ 17, 20933 }, -- Husk of the Old God
				{ 19, 21221 }, -- Eye of C'Thun
				{ 21, 22734 }, -- Base of Atiesh
			},
		},
		{ -- AQ40Trash1
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  21838 }, -- Garb of Royal Ascension
				{ 2,  21888 }, -- Gloves of the Immortal
				{ 3,  21889 }, -- Gloves of the Redeemed Prophecy
				{ 4,  21856 }, -- Neretzek, The Blood Drinker
				{ 5,  21837 }, -- Anubisath Warhammer
				{ 6,  21836 }, -- Ritssyn's Ring of Chaos
				{ 7,  21891 }, -- Shard of the Fallen Star
				{ 16, 21218 }, -- Blue Qiraji Resonating Crystal
				{ 17, 21324 }, -- Yellow Qiraji Resonating Crystal
				{ 18, 21323 }, -- Green Qiraji Resonating Crystal
				{ 19, 21321 }, -- Red Qiraji Resonating Crystal
			},
		},
		AQ_SCARABS,
		AQ_ENCHANTS,
		AQ_OPENING,
	},
}

data["Naxxramas"] = {
	name = AL["Naxxramas"],
	ContentType = RAID40_CONTENT,
	LoadDifficulty = RAID40_DIFF,
	ContentPhase = 6,
	items = {
		-- The Arachnid Quarter
		{ -- NAXAnubRekhan
			name = AL["Anub'Rekhan"],
			npcID = 15956,
			Level = 999,
			DisplayIDs = {{15931}},
			AtlasMapBossID = "1",
			NameColor = BLUE,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22369 }, -- Desecrated Bindings
				{ 5,  22362 }, -- Desecrated Wristguards
				{ 6,  22355 }, -- Desecrated Bracers
				{ 8,  22935 }, -- Touch of Frost
				{ 9,  22938 }, -- Cryptfiend Silk Cloak
				{ 10, 22936 }, -- Wristguards of Vengeance
				{ 11, 22939 }, -- Band of Unanswered Prayers
				{ 12, 22937 }, -- Gem of Nerubis
			},
		},
		{ -- NAXGrandWidowFaerlina
			name = AL["Grand Widow Faerlina"],
			npcID = 15953,
			Level = 999,
			DisplayIDs = {{15940}},
			AtlasMapBossID = "2",
			NameColor = BLUE,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22369 }, -- Desecrated Bindings
				{ 5,  22362 }, -- Desecrated Wristguards
				{ 6,  22355 }, -- Desecrated Bracers
				{ 8,  22943 }, -- Malice Stone Pendant
				{ 9,  22941 }, -- Polar Shoulder Pads
				{ 10, 22940 }, -- Icebane Pauldrons
				{ 11, 22942 }, -- The Widow's Embrace
				{ 12, 22806 }, -- Widow's Remorse
			},
		},
		{ -- NAXMaexxna
			name = AL["Maexxna"],
			npcID = 15952,
			Level = 999,
			DisplayIDs = {{15928}},
			AtlasMapBossID = "3",
			NameColor = BLUE,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22371 }, -- Desecrated Gloves
				{ 5,  22364 }, -- Desecrated Handguards
				{ 6,  22357 }, -- Desecrated Gauntlets
				{ 8,  22947 }, -- Pendant of Forgotten Names
				{ 9,  23220 }, -- Crystal Webbed Robe
				{ 10, 22954 }, -- Kiss of the Spider
				{ 11, 22807 }, -- Wraith Blade
				{ 12, 22804 }, -- Maexxna's Fang
			},
		},
		-- The Plague Quarter
		{ -- NAXNoththePlaguebringer
			name = AL["Noth the Plaguebringer"],
			npcID = 15954,
			Level = 999,
			DisplayIDs = {{16590}},
			AtlasMapBossID = "1",
			NameColor = PURP,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22370 }, -- Desecrated Belt
				{ 5,  22363 }, -- Desecrated Girdle
				{ 6,  22356 }, -- Desecrated Waistguard
				{ 8,  23030 }, -- Cloak of the Scourge
				{ 9,  23031 }, -- Band of the Inevitable
				{ 10, 23028 }, -- Hailstone Band
				{ 11, 23029 }, -- Noth's Frigid Heart
				{ 12, 23006 }, -- Libram of Light
				{ 13, 23005 }, -- Totem of Flowing Water
				{ 14, 22816 }, -- Hatchet of Sundered Bone
			},
		},
		{ -- NAXHeigantheUnclean
			name = AL["Heigan the Unclean"],
			npcID = 15936,
			Level = 999,
			DisplayIDs = {{16309}},
			AtlasMapBossID = "2",
			NameColor = PURP,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22370 }, -- Desecrated Belt
				{ 5,  22363 }, -- Desecrated Girdle
				{ 6,  22356 }, -- Desecrated Waistguard
				{ 8,  23035 }, -- Preceptor's Hat
				{ 9,  23033 }, -- Icy Scale Coif
				{ 10, 23019 }, -- Icebane Helmet
				{ 11, 23036 }, -- Necklace of Necropsy
				{ 12, 23068 }, -- Legplates of Carnage
			},
		},
		{ -- NAXLoatheb
			name = AL["Loatheb"],
			npcID = 16011,
			Level = 999,
			DisplayIDs = {{16110}},
			AtlasMapBossID = "3",
			NameColor = PURP,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22366 }, -- Desecrated Leggings
				{ 5,  22359 }, -- Desecrated Legguards
				{ 6,  22352 }, -- Desecrated Legplates
				{ 8,  23038 }, -- Band of Unnatural Forces
				{ 9,  23037 }, -- Ring of Spiritual Fervor
				{ 10, 23042 }, -- Loatheb's Reflection
				{ 11, 23039 }, -- The Eye of Nerub
				{ 12, 22800 }, -- Brimstone Staff
			},
		},
		-- The Military Quarter
		{ -- NAXInstructorRazuvious
			name = AL["Instructor Razuvious"],
			npcID = 16061,
			Level = 999,
			DisplayIDs = {{16582}},
			AtlasMapBossID = "1",
			NameColor = _RED,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22372 }, -- Desecrated Sandals
				{ 5,  22365 }, -- Desecrated Boots
				{ 6,  22358 }, -- Desecrated Sabatons
				{ 8,  23017 }, -- Veil of Eclipse
				{ 9,  23219 }, -- Girdle of the Mentor
				{ 10, 23018 }, -- Signet of the Fallen Defender
				{ 11, 23004 }, -- Idol of Longevity
				{ 12, 23009 }, -- Wand of the Whispering Dead
				{ 13, 23014 }, -- Iblis, Blade of the Fallen Seraph
			},
		},
		{ -- NAXGothiktheHarvester
			name = AL["Gothik the Harvester"],
			npcID = 16060,
			Level = 999,
			DisplayIDs = {{16279}},
			AtlasMapBossID = "2",
			NameColor = _RED,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22372 }, -- Desecrated Sandals
				{ 5,  22365 }, -- Desecrated Boots
				{ 6,  22358 }, -- Desecrated Sabatons
				{ 8,  23032 }, -- Glacial Headdress
				{ 9,  23020 }, -- Polar Helmet
				{ 10, 23023 }, -- Sadist's Collar
				{ 11, 23021 }, -- The Soul Harvester's Bindings
				{ 12, 23073 }, -- Boots of Displacement
			},
		},
		{ -- NAXTheFourHorsemen
			name = AL["The Four Horsemen"],
			npcID = {16064, 16065, 16062, 16063},
			Level = 999,
			DisplayIDs = {{16155},{16153},{16139},{16154}},
			AtlasMapBossID = "3",
			NameColor = _RED,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22351 }, -- Desecrated Robe
				{ 5,  22350 }, -- Desecrated Tunic
				{ 6,  22349 }, -- Desecrated Breastplate
				{ 8,  23071 }, -- Leggings of Apocalypse
				{ 9,  23025 }, -- Seal of the Damned
				{ 10, 23027 }, -- Warmth of Forgiveness
				{ 11, 22811 }, -- Soulstring
				{ 12, 22809 }, -- Maul of the Redeemed Crusader
				{ 13, 22691 }, -- Corrupted Ashbringer
			},
		},
		-- The Construct Quarter
		{ -- NAXPatchwerk
			name = AL["Patchwerk"],
			npcID = 16028,
			Level = 999,
			DisplayIDs = {{16174}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22368 }, -- Desecrated Shoulderpads
				{ 5,  22361 }, -- Desecrated Spaulders
				{ 6,  22354 }, -- Desecrated Pauldrons
				{ 8,  22960 }, -- Cloak of Suturing
				{ 9,  22961 }, -- Band of Reanimation
				{ 10, 22820 }, -- Wand of Fates
				{ 11, 22818 }, -- The Plague Bearer
				{ 12, 22815 }, -- Severance
			},
		},
		{ -- NAXGrobbulus
			name = AL["Grobbulus"],
			npcID = 15931,
			Level = 999,
			DisplayIDs = {{16035}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22368 }, -- Desecrated Shoulderpads
				{ 5,  22361 }, -- Desecrated Spaulders
				{ 6,  22354 }, -- Desecrated Pauldrons
				{ 8,  22968 }, -- Glacial Mantle
				{ 9,  22967 }, -- Icy Scale Spaulders
				{ 10, 22810 }, -- Toxin Injector
				{ 11, 22803 }, -- Midnight Haze
				{ 12, 22988 }, -- The End of Dreams
			},
		},
		{ -- NAXGluth
			name = AL["Gluth"],
			npcID = 15932,
			Level = 999,
			DisplayIDs = {{16064}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22983 }, -- Rime Covered Mantle
				{ 5,  22981 }, -- Gluth's Missing Collar
				{ 6,  22994 }, -- Digested Hand of Power
				{ 7,  23075 }, -- Death's Bargain
				{ 8,  22813 }, -- Claymore of Unholy Might
				{ 16, 22368 }, -- Desecrated Shoulderpads
				{ 17, 22369 }, -- Desecrated Bindings
				{ 18, 22370 }, -- Desecrated Belt
				{ 19, 22372 }, -- Desecrated Sandals
				{ 20, 22361 }, -- Desecrated Spaulders
				{ 21, 22362 }, -- Desecrated Wristguards
				{ 22, 22363 }, -- Desecrated Girdle
				{ 23, 22365 }, -- Desecrated Boots
				{ 24, 22354 }, -- Desecrated Pauldrons
				{ 25, 22355 }, -- Desecrated Bracers
				{ 26, 22356 }, -- Desecrated Waistguard
				{ 27, 22358 }, -- Desecrated Sabatons
			},
		},
		{ -- NAXThaddius
			name = AL["Thaddius"],
			npcID = 15928,
			Level = 999,
			DisplayIDs = {{16137}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  22726 }, -- Splinter of Atiesh
				{ 2,  22727 }, -- Frame of Atiesh
				{ 4,  22367 }, -- Desecrated Circlet
				{ 5,  22360 }, -- Desecrated Headpiece
				{ 6,  22353 }, -- Desecrated Helmet
				{ 8,  23000 }, -- Plated Abomination Ribcage
				{ 9,  23070 }, -- Leggings of Polarity
				{ 10, 23001 }, -- Eye of Diminution
				{ 11, 22808 }, -- The Castigator
				{ 12, 22801 }, -- Spire of Twilight
			},
		},
		-- Frostwyrm Lair
		{ -- NAXSapphiron
			name = AL["Sapphiron"],
			npcID = 15989,
			Level = 999,
			DisplayIDs = {{16033}},
			AtlasMapBossID = "1",
			NameColor = GREEN,
			[NORMAL_DIFF] = {
				{ 1,  23050 }, -- Cloak of the Necropolis
				{ 2,  23045 }, -- Shroud of Dominion
				{ 3,  23040 }, -- Glyph of Deflection
				{ 4,  23047 }, -- Eye of the Dead
				{ 5,  23041 }, -- Slayer's Crest
				{ 6,  23046 }, -- The Restrained Essence of Sapphiron
				{ 7,  23049 }, -- Sapphiron's Left Eye
				{ 8,  23048 }, -- Sapphiron's Right Eye
				{ 9,  23043 }, -- The Face of Death
				{ 10, 23242 }, -- Claw of the Frost Wyrm
				{ 16, 23549 }, -- Fortitude of the Scourge
				{ 17, 23548 }, -- Might of the Scourge
				{ 18, 23545 }, -- Power of the Scourge
				{ 19, 23547 }, -- Resilience of the Scourge
			},
		},
		{ -- NAXKelThuzard
			name = AL["Kel'Thuzad"],
			npcID = 15990,
			Level = 999,
			DisplayIDs = {{15945}},
			AtlasMapBossID = "2",
			NameColor = GREEN,
			[NORMAL_DIFF] = {
				{ 1,  23057 }, -- Gem of Trapped Innocents
				{ 2,  23053 }, -- Stormrage's Talisman of Seething
				{ 3,  22812 }, -- Nerubian Slavemaker
				{ 4,  22821 }, -- Doomfinger
				{ 5,  22819 }, -- Shield of Condemnation
				{ 6,  22802 }, -- Kingsfall
				{ 7,  23056 }, -- Hammer of the Twisting Nether
				{ 8,  23054 }, -- Gressil, Dawn of Ruin
				{ 9,  23577 }, -- The Hungering Cold
				{ 10, 22798 }, -- Might of Menethil
				{ 11, 22799 }, -- Soulseeker
				{ 13, 22520 }, -- The Phylactery of Kel'Thuzad
				{ 16, 23061 }, -- Ring of Faith
				{ 17, 23062 }, -- Frostfire Ring
				{ 18, 23063 }, -- Plagueheart Ring
				{ 19, 23060 }, -- Bonescythe Ring
				{ 20, 23064 }, -- Ring of the Dreamwalker
				{ 21, 23067 }, -- Ring of the Cryptstalker
				{ 22, 23065 }, -- Ring of the Earthshatterer
				{ 23, 23066 }, -- Ring of Redemption
				{ 24, 23059 }, -- Ring of the Dreadnaught
				{ 26, 22733 }, -- Staff Head of Atiesh
			},
		},
		{ -- NAXTrash
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  23664 }, -- Pauldrons of Elemental Fury
				{ 2,  23667 }, -- Spaulders of the Grand Crusader
				{ 3,  23069 }, -- Necro-Knight's Garb
				{ 4,  23226 }, -- Ghoul Skin Tunic
				{ 5,  23663 }, -- Girdle of Elemental Fury
				{ 6,  23666 }, -- Belt of the Grand Crusader
				{ 7,  23665 }, -- Leggings of Elemental Fury
				{ 8,  23668 }, -- Leggings of the Grand Crusader
				{ 9,  23237 }, -- Ring of the Eternal Flame
				{ 10, 23238 }, -- Stygian Buckler
				{ 11, 23044 }, -- Harbinger of Doom
				{ 12, 23221 }, -- Misplaced Servo Arm
				{ 16, 22376 }, -- Wartorn Cloth Scrap
				{ 17, 22373 }, -- Wartorn Leather Scrap
				{ 18, 22374 }, -- Wartorn Chain Scrap
				{ 19, 22375 }, -- Wartorn Plate Scrap
				{ 21, 23055 }, -- Word of Thawing
				{ 22, 22682 }, -- Frozen Rune
			},
		},
		T3_SET,
	},
}

data["BlackfathomDeeps"] = {
	name = AL["Blackfathom Deeps"],
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = GetForVersion({15, 24, 32}, {19, 22, 24}),
	items = {
		{ -- BFDGhamoora
			name = AL["Ghamoo-ra"],
			npcID = 4887,
			Level = GetForVersion(25,23),
			DisplayIDs = {{5027}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  6907 }, -- Tortoise Armor
				{ 3,  6908 }, -- Ghamoo-ra's Bind
			},
		},
		{ -- BFDLadySarevess
			name = AL["Lady Sarevess"],
			npcID = 4831,
			Level = GetForVersion(25,23),
			DisplayIDs = {{4979}},
			AtlasMapBossID = 3,
			[NORMAL_DIFF] = {
				{ 1,  888 }, -- Naga Battle Gloves
				{ 3,  3078 }, -- Naga Heartpiercer
				{ 4,  11121 }, -- Darkwater Talwar
			},
		},
		{ -- BFDGelihast
			name = AL["Gelihast"],
			npcID = 6243,
			Level = GetForVersion(26,24),
			DisplayIDs = {{1773}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  6906 }, -- Algae Fists
				{ 3,  6905 }, -- Reef Axe
				{ 5,  1470 }, -- Murloc Skin Bag
			},
		},
		{ -- BFDBaronAquanis
			name = AL["Baron Aquanis"],
			npcID = 12876,
			Level = GetForVersion(28,24),
			DisplayIDs = {{110}},
			AtlasMapFile = {"CL_BlackfathomDeepsB", "CL_BlackfathomDeepsEnt"},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1,  16782 }, -- Strange Water Globe
			},
		},
		{ -- BFDTwilightLordKelris
			name = AL["Twilight Lord Kelris"],
			npcID = 4832,
			Level = GetForVersion(27,24),
			DisplayIDs = {{4939}},
			AtlasMapFile = {"CL_BlackfathomDeepsB", "CL_BlackfathomDeepsEnt"},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  1155 }, -- Rod of the Sleepwalker
				{ 3,  6903 }, -- Gaze Dreamer Pants
			},
		},
		{ -- BFDOldSerrakis
			name = AL["Old Serra'kis"],
			npcID = 4830,
			Level = GetForVersion(26,24),
			DisplayIDs = {{1816}},
			AtlasMapFile = {"CL_BlackfathomDeepsC", "CL_BlackfathomDeepsEnt"},
			AtlasMapBossID = 9,
			[NORMAL_DIFF] = {
				{ 1,  6901 }, -- Glowing Thresher Cape
				{ 2,  6904 }, -- Bite of Serra'kis
				{ 4,  6902 }, -- Bands of Serra'kis
			},
		},
		{ -- BFDAkumai
			name = AL["Aku'mai"],
			npcID = 4829,
			Level = GetForVersion(28,24),
			DisplayIDs = {{2837}},
			AtlasMapBossID = 10,
			AtlasMapFile = {"CL_BlackfathomDeepsB", "CL_BlackfathomDeepsEnt"},
			[NORMAL_DIFF] = {
				{ 1,  6911 }, -- Moss Cinch
				{ 2,  6910 }, -- Leech Pants
				{ 3,  6909 }, -- Strike of the Hydra
			},
		},
		{ -- BFDTrash
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  1486 }, -- Tree Bark Jacket
				{ 2,  3416 }, -- Martyr's Chain
				{ 3,  1491 }, -- Ring of Precision
				{ 4,  3414 }, -- Crested Scepter
				{ 5,  1454 }, -- Axe of the Enforcer
				{ 6,  1481 }, -- Grimclaw
				{ 7,  2567 }, -- Evocator's Blade
				{ 8,  3413 }, -- Doomspike
				{ 9,  3417 }, -- Onyx Claymore
				{ 10, 3415 }, -- Staff of the Friar
				{ 11, 2271 }, -- Staff of the Blessed Seer
			},
		},
	},
}

data["Gnomeregan"] = {
	name = AL["Gnomeregan"],
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = GetForVersion({19, 29, 38},{15, 25, 28}),
	items = {
		{ -- GnTechbot
			name = AL["Techbot"],
			npcID = 6231,
			Level = 26,
			DisplayIDs = {{7288}},
			[NORMAL_DIFF] = {
				{ 1,  9444 }, -- Techbot CPU Shell
			},
		},
		{ -- GnGrubbis
			name = AL["Grubbis"],
			npcID = 7361,
			Level = GetForVersion(32,28),
			DisplayIDs = {{6533}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  9445 }, -- Grubbis Paws
			},
		},
		{ -- GnViscousFallout
			name = AL["Viscous Fallout"],
			npcID = 7079,
			Level = GetForVersion(30,28),
			DisplayIDs = {{5497}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  9454 }, -- Acidic Walkers
				{ 2,  9453 }, -- Toxic Revenger
				{ 3,  9452 }, -- Hydrocane
			},
		},
		{ -- GnElectrocutioner6000
			name = AL["Electrocutioner 6000"],
			npcID = 6235,
			Level = GetForVersion(32,28),
			DisplayIDs = {{6915}},
			AtlasMapBossID = 5,
			[NORMAL_DIFF] = {
				{ 1,  9447 }, -- Electrocutioner Lagnut
				{ 2,  9446 }, -- Electrocutioner Leg
				{ 4,  9448 }, -- Spidertank Oilrag
				{ 6,  6893 }, -- Workshop Key
			},
		},
		{ -- GnCrowdPummeler960
			name = AL["Crowd Pummeler 9-60"],
			npcID = 6229,
			Level = GetForVersion(32,28),
			DisplayIDs = {{6774}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  9449 }, -- Manual Crowd Pummeler
				{ 3,  9450 }, -- Gnomebot Operating Boots
			},
		},
		{ -- GnDIAmbassador
			name = AL["Dark Iron Ambassador"],
			npcID = 6228,
			Level = GetForVersion(33,28),
			DisplayIDs = {{6669}},
			AtlasMapBossID = 7,
			specialType = "rare",
			[NORMAL_DIFF] = {
				{ 1,  9455 }, -- Emissary Cuffs
				{ 2,  9456 }, -- Glass Shooter
				{ 3,  9457 }, -- Royal Diplomatic Scepter
			},
		},
		{ -- GnMekgineerThermaplugg
			name = AL["Mekgineer Thermaplugg"],
			npcID = 7800,
			Level = GetForVersion(34,28),
			DisplayIDs = {{6980}},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  9492 }, -- Electromagnetic Gigaflux Reactivator
				{ 2,  9461 }, -- Charged Gear
				{ 3,  9458 }, -- Thermaplugg's Central Core
				{ 4,  9459 }, -- Thermaplugg's Left Arm
				{ 16, 4415 }, -- Schematic: Craftsman's Monocle
				--{ 17, 4393 }, -- Craftsman's Monocle
				{ 17, 4413 }, -- Schematic: Discombobulator Ray
				--{ 20, 4388 }, -- Discombobulator Ray
				{ 18, 4411 }, -- Schematic: Flame Deflector
				--{ 23, 4376 }, -- Flame Deflector
				{ 19, 7742 }, -- Schematic: Gnomish Cloaking Device
				--{ 26, 4397 }, -- Gnomish Cloaking Device
				{ 20, 11828 }, -- Schematic: Pet Bombling
				--{ 29, 11825 }, -- Pet Bombling
			},
		},
		{ -- GnTrash
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  9508 }, -- Mechbuilder's Overalls
				{ 2,  9491 }, -- Hotshot Pilot's Gloves
				{ 3,  9509 }, -- Petrolspill Leggings
				{ 4,  9510 }, -- Caverndeep Trudgers
				{ 5,  9487 }, -- Hi-tech Supergun
				{ 6,  9485 }, -- Vibroblade
				{ 7,  9488 }, -- Oscillating Power Hammer
				{ 8,  9486 }, -- Supercharger Battle Axe
				{ 9,  9490 }, -- Gizmotron Megachopper
				{ 11, 9489 }, -- Gyromatic Icemaker
				{ 12, 11827 }, -- Schematic: Lil' Smoky
				--{ 15, 11826 }, -- Lil' Smoky
				{ 16, 9327 }, -- Security DELTA Data Access Card
				{ 18, 7191 }, -- Fused Wiring
				{ 19, 9308 }, -- Grime-Encrusted Object
				{ 20, 9326 }, -- Grime-Encrusted Ring
				{ 22, 9279 }, -- White Punch Card
				{ 23, 9280 }, -- Yellow Punch Card
				{ 24, 9282 }, -- Blue Punch Card
				{ 25, 9281 }, -- Red Punch Card
				{ 26, 9316 }, -- Prismatic Punch Card
			},
		},
	},
}

data["TheTempleOfAtal'Hakkar"] = {
	name = AL["Temple of Atal'Hakkar"],
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = GetForVersion({45, 50, 60},{35, 47, 50}),
	items = {
		{ -- STBalconyMinibosses
			name = AL["Balcony Minibosses"],
			npcID = {5716, 5712, 5717, 5714, 5715, 5713},
			Level = GetForVersion({51, 52}, {459,50}),
			DisplayIDs = {{6701},{6699},{6707},{6700},{6702},{6698}},
			AtlasMapBossID = "C",
			[NORMAL_DIFF] = {
				{ 1,  10783 }, -- Atal'ai Spaulders
				{ 2,  10784 }, -- Atal'ai Breastplate
				{ 3,  10787 }, -- Atal'ai Gloves
				{ 5,  10788 }, -- Atal'ai Girdle
				{ 6,  10785 }, -- Atal'ai Leggings
				{ 7,  10786 }, -- Atal'ai Boots
				{ 9,  20606 }, -- Amber Voodoo Feather
				{ 10, 20607 }, -- Blue Voodoo Feather
				{ 11, 20608 }, -- Green Voodoo Feather
			},
		},
		{ -- STAtalalarion
			name = AL["Atal'alarion"],
			npcID = 8580,
			Level = GetForVersion(50,49),
			DisplayIDs = {{7873}},
			AtlasMapBossID = 1,
			[NORMAL_DIFF] = {
				{ 1,  10800 }, -- Darkwater Bracers
				{ 2,  10798 }, -- Atal'alarion's Tusk Ring
				{ 3,  10799 }, -- Headspike
			},
		},
		{ -- STSpawnOfHakkar
			name = AL["Spawn of Hakkar"],
			npcID = 5708,
			Level = GetForVersion(51,49),
			DisplayIDs = {{4065}},
			AtlasMapBossID = 2,
			[NORMAL_DIFF] = {
				{ 1,  10801 }, -- Slitherscale Boots
				{ 3,  10802 }, -- Wingveil Cloak
			},
		},
		{ -- STAvatarofHakkar
			name = AL["Avatar of Hakkar"],
			npcID = 8443,
			DisplayIDs = {{8053}},
			AtlasMapBossID = 3,
			Level = 48,
			[NORMAL_DIFF] = {
				{ 1,  12462 }, -- Embrace of the Wind Serpent
				{ 3,  10843 }, -- Featherskin Cape
				{ 4,  10845 }, -- Warrior's Embrace
				{ 5,  10842 }, -- Windscale Sarong
				{ 6,  10846 }, -- Bloodshot Greaves
				{ 7,  10838 }, -- Might of Hakkar
				{ 8,  10844 }, -- Spire of Hakkar
			},
		},
		{ -- STJammalan
			name = AL["Jammal'an the Prophet"],
			npcID = 5710,
			Level = GetForVersion(54,50),
			DisplayIDs = {{6708}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  10806 }, -- Vestments of the Atal'ai Prophet
				{ 2,  10808 }, -- Gloves of the Atal'ai Prophet
				{ 3,  10807 }, -- Kilt of the Atal'ai Prophet
			},
		},
		{ -- STOgom
			name = AL["Ogom the Wretched"],
			npcID = 5711,
			Level = GetForVersion(53,49),
			DisplayIDs = {{6709}},
			AtlasMapBossID = 4,
			[NORMAL_DIFF] = {
				{ 1,  10805 }, -- Eater of the Dead
				{ 2,  10803 }, -- Blade of the Wretched
				{ 3,  10804 }, -- Fist of the Damned
			},
		},
		{ -- STDreamscythe
			name = AL["Dreamscythe"],
			npcID = 5721,
			Level = GetForVersion(53,50),
			DisplayIDs = {{7553}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  12465 }, -- Nightfall Drape
				{ 2,  12466 }, -- Dawnspire Cord
				{ 3,  12464 }, -- Bloodfire Talons
				{ 4,  10797 }, -- Firebreather
				{ 5,  12463 }, -- Drakefang Butcher
				{ 6,  12243 }, -- Smoldering Claw
				{ 7,  10795 }, -- Drakeclaw Band
				{ 8,  10796 }, -- Drakestone
			},
		},
		{ -- STWeaver
			name = AL["Weaver"],
			npcID = 5720,
			Level = GetForVersion(51,50),
			DisplayIDs = {{6375}},
			AtlasMapBossID = 6,
			[NORMAL_DIFF] = {
				{ 1,  12465 }, -- Nightfall Drape
				{ 2,  12466 }, -- Dawnspire Cord
				{ 3,  12464 }, -- Bloodfire Talons
				{ 4,  10797 }, -- Firebreather
				{ 5,  12463 }, -- Drakefang Butcher
				{ 6,  12243 }, -- Smoldering Claw
				{ 7,  10795 }, -- Drakeclaw Band
				{ 8,  10796 }, -- Drakestone
			},
		},
		{ -- STHazzas
			name = AL["Hazzas"],
			npcID = 5722,
			Level = GetForVersion(53,50),
			DisplayIDs = {{9584}},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1,  12465 }, -- Nightfall Drape
				{ 2,  12466 }, -- Dawnspire Cord
				{ 3,  12464 }, -- Bloodfire Talons
				{ 4,  10797 }, -- Firebreather
				{ 5,  12463 }, -- Drakefang Butcher
				{ 6,  12243 }, -- Smoldering Claw
				{ 7,  10795 }, -- Drakeclaw Band
				{ 8,  10796 }, -- Drakestone
			},
		},
		{ -- STMorphaz
			name = AL["Morphaz"],
			npcID = 5719,
			Level = GetForVersion(52,50),
			DisplayIDs = {{7975}},
			AtlasMapBossID = 7,
			[NORMAL_DIFF] = {
				{ 1,  12465 }, -- Nightfall Drape
				{ 2,  12466 }, -- Dawnspire Cord
				{ 3,  12464 }, -- Bloodfire Talons
				{ 4,  10797 }, -- Firebreather
				{ 5,  12463 }, -- Drakefang Butcher
				{ 6,  12243 }, -- Smoldering Claw
				{ 7,  10795 }, -- Drakeclaw Band
				{ 8,  10796 }, -- Drakestone
			},
		},
		{ -- STEranikus
			name = AL["Shade of Eranikus"],
			npcID = 5709,
			Level = GetForVersion(55,50),
			DisplayIDs = {{7806}},
			AtlasMapBossID = 8,
			[NORMAL_DIFF] = {
				{ 1,  10847 }, -- Dragon's Call
				{ 3,  10833 }, -- Horns of Eranikus
				{ 4,  10829 }, -- Dragon's Eye
				{ 5,  10836 }, -- Rod of Corrosion
				{ 6,  10835 }, -- Crest of Supremacy
				{ 7,  10837 }, -- Tooth of Eranikus
				{ 8,  10828 }, -- Dire Nail
				{ 10, 10454 }, -- Essence of Eranikus
			},
		},
		{ -- STTrash
			name = AL["Trash"],
			ExtraList = true,
			[NORMAL_DIFF] = {
				{ 1,  10630 }, -- Soulcatcher Halo
				{ 2,  10632 }, -- Slimescale Bracers
				{ 3,  10631 }, -- Murkwater Gauntlets
				{ 4,  10633 }, -- Silvershell Leggings
				{ 5,  10629 }, -- Mistwalker Boots
				{ 6,  10634 }, -- Mindseye Circle
				{ 7,  10624 }, -- Stinging Bow
				{ 8,  10623 }, -- Winter's Bite
				{ 9,  10625 }, -- Stealthblade
				{ 10, 10626 }, -- Ragehammer
				{ 11, 10628 }, -- Deathblow
				{ 12, 10627 }, -- Bludgeon of the Grinning Dog
				{ 16, 10782 }, -- Hakkari Shroud
				{ 17, 10781 }, -- Hakkari Breastplate
				{ 18, 10780 }, -- Mark of Hakkar
				{ 20, 16216 }, -- Formula: Enchant Cloak - Greater Resistance
				{ 21, 15733 }, -- Pattern: Green Dragonscale Leggings
			},
		},
	},
}

