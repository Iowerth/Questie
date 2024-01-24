---@class SeasonOfDiscovery
local SeasonOfDiscovery = QuestieLoader:CreateModule("SeasonOfDiscovery")
-------------------------
--Import modules.
-------------------------
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type QuestieQuestBlacklist
local QuestieQuestBlacklist = QuestieLoader:ImportModule("QuestieQuestBlacklist")

SeasonOfDiscovery.currentPhase = 1 -- TODO: Use API function which hopefully will come in the future



local runeQuestsInSoD = {-- List quests here to have them flagged as Rune quests in Season of Discovery
    [1470]  = true, -- Warlock Metamorphosis Part 1
    [4763]  = true, -- Warlock Shadow Bolt Volley Darkshore
    [76156] = true, -- Shaman Lava Lash Part 1
    [76160] = true, -- Shaman Lava Lash Part 2
    [76240] = true, -- Shaman Lava Lash Part 3
    [77568] = true, -- Hunter Chimera Shot
    [77571] = true, -- Druid Fury of Stormrage Alliance
    [77573] = true, -- Rogue Shadowstrike Nightelf
    [77574] = true, -- Priest Penance
    [77575] = true, -- Warrior Victory Rush
    [77582] = true, -- Warrior Victory Rush
    [77583] = true, -- Rogue Shadowstrike Orc
    [77584] = true, -- Hunter Chimera Shot
    [77585] = true, -- Shaman Overload
    [77586] = true, -- Warlock Haunt
    [77587] = true, -- Shaman Overload
    [77588] = true, -- Warrior Victory Rush
    [77592] = true, -- Rogue Shadowstrike Troll
    [77616] = true, -- Warrior Victory Rush
    [77617] = true, -- Paladin Crusader Strike Elwynn Forest
    [77618] = true, -- Rogue Shadowstrike Human
    [77619] = true, -- Priest Penance
    [77620] = true, -- Mage Ice Lance Elwynn Forest
    [77621] = true, -- Warlock Haunt
    [77642] = true, -- Priest Penance
    [77643] = true, -- Mage Ice Lance Durotar
    [77648] = true, -- Druid Fury of Stormrage Horde
    [77649] = true, -- Hunter Chimera Shot
    [77651] = true, -- Warrior Victory Rush
    [77652] = true, -- Shaman Overload
    [77655] = true, -- Warrior Victory Rush
    [77656] = true, -- Warrior Victory Rush
    [77657] = true, -- Paladin Crusader Strike Dun Morogh
    [77658] = true, -- Rogue Shadowstrike Dwarf
    [77659] = true, -- Rogue Shadowstrike Gnome
    [77660] = true, -- Hunter Chimera Shot
    [77661] = true, -- Priest Penance
    [77666] = true, -- Warlock Haunt
    [77668] = true, -- Warrior Victory Rush
    [77667] = true, -- Mage Ice Lance Dun Morogh
    [77669] = true, -- Rogue Shadowstrike Undead
    [77670] = true, -- Priest Penance
    [77671] = true, -- Mage Ice Lance Tirisfal Glades
    [77672] = true, -- Warlock Haunt
    [78088] = true, -- Paladin Divine Storm
    [78089] = true, -- Paladin Divine Storm
    [78090] = true, -- Paladin Divine Storm
    [78091] = true, -- Paladin Divine Storm
    [78092] = true, -- Paladin Divine Storm
    [78093] = true, -- Paladin Divine Storm
    [78114] = true, -- Hunter Kill Command Part 1
    [78121] = true, -- Hunter Kill Command Part 2
    [78124] = true, -- Mage Icy Veins
    [78127] = true, -- Mage Icy Veins
    [78132] = true, -- Warrior Raging Blows Part 1
    [78133] = true, -- Warrior Raging Blows Part 1
    [78134] = true, -- Warrior Raging Blows Part 1
    [78142] = true, -- Mage Icy Veins
    [78143] = true, -- Mage Icy Veins
    [78144] = true, -- Warrior Raging Blows Part 2
    [78145] = true, -- Mage Icy Veins
    [78146] = true, -- Mage Icy Veins
    [78147] = true, -- Mage Icy Veins
    [78148] = true, -- Mage Icy Veins
    [78149] = true, -- Mage Icy Veins
    [78150] = true, -- Mage Icy Veins
    [78229] = true, -- Druid Wild Growth
    [78261] = true, -- Rogue Deadly Brew Part 2
    [78265] = true, -- Grizzby prequest for multiple runes
    [78266] = true, -- Grizzby prequest for multiple runes
    [78267] = true, -- Grizzby prequest for multiple runes
    [78270] = true, -- Rogue Deadly Brew Part 3
    [78277] = true, -- Mage Horde Living Bomb
    [78307] = true, -- Rogue Deadly Brew Part 3
    [78506] = true, -- Shaman Earth Shield Part 1
    [78537] = true, -- Shaman Earth Shield Part 2
    [78561] = true, -- Shaman Earth Shield Part 3
    [78575] = true, -- Shaman Earth Shield Part 4
    [78680] = true, -- Warlock Metamorphosis Part 2
    [78681] = true, -- Warlock Metamorphosis Part 3
    [78684] = true, -- Warlock Metamorphosis Part 4
    [78702] = true, -- Warlock Metamorphosis Part 5
    [79091] = true, -- Mage Icy Veins
    [79092] = true, -- Mage Icy Veins
    [79093] = true, -- Mage Icy Veins
    [79094] = true, -- Mage Icy Veins
    [79095] = true, -- Mage Icy Veins
    [79096] = true, -- Mage Icy Veins
    [79097] = true, -- Mage Icy Veins

    -- fake IDs
    --- Mage runes
    [90000] = true, -- Mage Arcane Blast
    [90001] = true, -- Mage Alliance Burnout
    [90002] = true, -- Mage Alliance Burnout
    [90003] = true, -- Mage Burnout
    [90004] = true, -- Mage Alliance Fingers of Frost
    [90005] = true, -- Mage Horde Fingers of Frost
    [90006] = true, -- Mage Alliance Regeneration
    [90007] = true, -- Mage Horde Regeneration
    [90008] = true, -- Mage Alliance Regeneration
    [90009] = true, -- Mage Horde Regeneration
    [90010] = true, -- Mage Alliance Enlightenment
    [90011] = true, -- Mage Horde Enlightenment
    [90012] = true, -- Mage Alliance Arcane Surge
    [90013] = true, -- Mage Horde Arcane Surge
    [90014] = true, -- Mage Mass Regeneration
    [90015] = true, -- Mage Alliance Living Flame
    [90016] = true, -- Mage Alliance Living Flame
    [90017] = true, -- Mage Horde Living Flame
    [90018] = true, -- Mage Horde Living Flame
    [90019] = true, -- Mage Rewind Time
    [90020] = true, -- Mage Alliance Living Bomb
    [90021] = true, -- Mage Horde Living Bomb
    --- Mage runes end
    [90022] = true, -- Paladin Divine Storm
    [90023] = true, -- Druid Wild Strikes
    [90024] = true, -- Druid Survival of the Fittest
    [90025] = true, -- Priest Serendipity
    [90026] = true, -- Paladin Divine Sacrifice
    [90027] = true, -- Hunter Lone Wolf
    [90028] = true, -- Warrior Warbringer
    [90029] = true, -- Warlock Demonic Pact
    [90030] = true, -- Rogue Main Gauche
    [90031] = true, -- Shaman Dual Wield Specialization
    [90032] = true, -- Warlock Lake of Fire Start
    [90033] = true, -- Warlock Lake of Fire End
    [90034] = true, -- Warlock Master Channeler Alliance
    [90035] = true, -- Warlock Master Channeler Alliance
    [90036] = true, -- Warlock Master Channeler Westfall
    [90037] = true, -- Warlock Master Channeler Horde
    [90038] = true, -- Warlock Master Channeler Horde
    [90039] = true, -- Warlock Chaos Bolt Dun Morogh
    [90040] = true, -- Paladin Beacon of Light Alliance
    [90041] = true, -- Shaman Healing Rain Horde
    [90042] = true, -- Warlock Everlasting Affliction Alliance
    [90043] = true, -- Warlock Everlasting Affliction Horde
    [90044] = true, -- Hunter Serpent Spread Alliance
    [90045] = true, -- Hunter Serpent Spread Horde
    [90046] = true, -- Warrior Single-Minded Fury Alliance
    [90047] = true, -- Warrior Single-Minded Fury Horde
    [90048] = true, -- Druid Skull Bash Alliance
    [90049] = true, -- Druid Skull Bash Horde
    [90050] = true, -- Rogue Just a Flesh Wound Alliance
    [90051] = true, -- Rogue Just a Flesh Wound Horde
    [90052] = true, -- Priest Mind Sear Alliance
    [90053] = true, -- Priest Mind Sear Horde
    [90054] = true, -- Druid Living Seed Alliance
    [90055] = true, -- Druid Living Seed Horde
    [90056] = true, -- Druid Starsurge
    [90057] = true, -- Druid Sunfire Alliance
    [90058] = true, -- Druid Lifebloom
    [90059] = true, -- Priest Prayer of Mending
    [90060] = true, -- Shaman Ancestral Guidance
    [90061] = true, -- Warlock Chaos Bolt Elwynn Forest
    [90062] = true, -- Warlock Chaos Bolt The Barrens
    [90063] = true, -- Warlock Chaos Bolt Tirisfal Glades
    [90064] = true, -- Warlock Shadow Bolt Volley Loch Modan
    [90065] = true, -- Warlock Shadow Bolt Volley Westfall start
    [90066] = true, -- Warlock Shadow Bolt Volley Westfall end
    [90067] = true, -- Warlock Shadow Bolt Volley The Barrens start
    [90068] = true, -- Warlock Shadow Bolt Volley The Barrens end
    [90069] = true, -- Warlock Shadow Bolt Volley Silverpine Forest
    [90070] = true, -- Warlock Incinerate
    [90071] = true, -- Warlock Demonic Tactics Alliance
    [90072] = true, -- Warlock Demonic Tactics Horde
    [90073] = true, -- Warlock Soul Siphon Dun Morogh
    [90074] = true, -- Warlock Soul Siphon Elwynn Forest
    [90075] = true, -- Warlock Soul Siphon Durotar
    [90076] = true, -- Warlock Soul Siphon Tirisfal Galdes
    [90077] = true, -- Warlock Demonic Grace Dun Morogh
    [90078] = true, -- Warlock Demonic Grace Elwynn Forest
    [90079] = true, -- Warlock Demonic Grace Durotar
    [90080] = true, -- Warlock Demonic Grace Tirisfal Galdes
    [90081] = true, -- Hunter Aspect of the Lion
    [90082] = true, -- Hunter Master Marksman
    [90083] = true, -- Hunter Cobra Strikes
    [90084] = true, -- Rogue Blade Dance Darkshore
    [90085] = true, -- Rogue Blade Dance Loch Modan
    [90086] = true, -- Rogue Blade Dance Westfall
    [90087] = true, -- Rogue Blade Dance The Barrens
    [90088] = true, -- Druid Wild Growth Ashenvale
    [90089] = true, -- Druid Wild Growth Duskwood
    [90090] = true, -- Druid Wild Growth Hillsbrad Foothills
    [90091] = true, -- Warrior Flagellation
    [90092] = true, -- Warrior Blood Frenzy
    [90093] = true, -- Warrior Furious Thunder
    [90094] = true, -- Warrior Consumed By Rage
    [90095] = true, -- Hunter Explosive Shot
    [90096] = true, -- Warrior Raging Blows
    [90097] = true, -- Warrior Raging Blows
    [90098] = true, -- Warrior Raging Blows
    [90099] = true, -- Warrior Raging Blows
    [90100] = true, -- Warrior Devastate
    [90101] = true, -- Warrior Devastate
    [90102] = true, -- Warrior Devastate
    [90103] = true, -- Warrior Devastate
    [90104] = true, -- Warrior Devastate
    [90105] = true, -- Warrior Devastate
    [90106] = true, -- Warrior Frenzied Assault
    [90107] = true, -- Warrior Frenzied Assault
    [90108] = true, -- Warrior Frenzied Assault
    [90109] = true, -- Warrior Frenzied Assault
    [90110] = true, -- Warrior Frenzied Assault
    [90111] = true, -- Warrior Frenzied Assault
    [90112] = true, -- Warrior Endless Rage Westfall
    [90113] = true, -- Warrior Endless Rage Darkshore
    [90114] = true, -- Warrior Endless Rage Loch Modan
    [90115] = true, -- Warrior Endless Rage The Barrens
    [90116] = true, -- Warrior Endless Rage Silverpine Forest
    [90117] = true, -- Paladin Seal of Martyrdom
    [90118] = true, -- Paladin Horn of Lordaeron
    [90119] = true, -- Paladin Horn of Lordaeron
    [90120] = true, -- Paladin Aegis
    [90121] = true, -- Paladin Inspiration Exemplar
    [90122] = true, -- Paladin Avenger's Shield
    [90123] = true, -- Paladin Rebuke
    [90124] = true, -- Paladin Rebuke
    [90125] = true, -- Paladin Rebuke
    [90126] = true, -- Paladin Hand of Reckoning
    [90127] = true, -- Druid Mangle Teldrassil
    [90128] = true, -- Druid Lacerate Loch Modan
    [90129] = true, -- Druid Lacerate The Barrens
    [90130] = true, -- Druid Savage Roar Darkshore
    [90131] = true, -- Druid Savage Roar The Barrens
    [90132] = true, -- Druid Savage Roar Loch Modan
    [90133] = true, -- Rogue Quick Draw Dun Morogh
    [90134] = true, -- Rogue Quick Draw Elwynn Forest
    [90135] = true, -- Rogue Quick Draw Teldrassil
    [90136] = true, -- Rogue Quick Draw Durotar
    [90137] = true, -- Rogue Quick Draw Tirisfal Glades
    [90138] = true, -- Rogue Slaughter from the Shadows Elwynn Forest, Dun Morogh, Durotar
    [90139] = true, -- Warrior Quick Strike Loch Modan
    [90140] = true, -- Warrior Quick Strike Westfall
    [90141] = true, -- Warrior Quick Strike Darkshore
    [90142] = true, -- Warrior Quick Strike The Barrens
    [90143] = true, -- Warrior Quick Strike Silverpine Forest
    [90144] = true, -- Druid Savage Roar Westfall
    [90145] = true, -- Druid Lacerate Darkshore
    [90146] = true, -- Druid Mangle Mulgore
    [90147] = true, -- Paladin Hand of Reckoning Westfall
    [90148] = true, -- Paladin Exorcist Duskwood
    [90149] = true, -- Hunter Heart of the Lion Wetlands
    [90150] = true, -- Hunter Sniper Training Darkshore
    [90151] = true, -- Hunter Sniper Training Westfall
    [90152] = true, -- Hunter Sniper Training Loch Modan
    [90153] = true, -- Hunter Sniper Training The Barrens
    [90154] = true, -- Druid Lacerate Westfall
    [90155] = true, -- Priest Void Plague Dun Morogh
    [90156] = true, -- Priest Void Plague Elwynn Forest
    [90157] = true, -- Priest Void Plague Teldrassil
    [90158] = true, -- Priest Void Plague Durotar
    [90159] = true, -- Priest Void Plague Tirisfal Glades
    [90161] = true, -- Priest Strength of Soul
    [90162] = true, -- Priest Twisted Faith Loch Modan
    [90163] = true, -- Priest Twisted Faith Westfall
    [90164] = true, -- Priest Twisted Faith Darkshore
    [90165] = true, -- Priest Twisted Faith The Barrens
    [90166] = true, -- Priest Twisted Faith Silverpine Forest
    [90167] = true, -- Hunter Flanking Strike Dun Morogh
    [90168] = true, -- Hunter Flanking Strike Teldrassil
    [90169] = true, -- Priest Power Word: Barrier Redridge Mountains
    [90170] = true, -- Hunter Flanking Strike Durotar
    [90171] = true, -- Hunter Flanking Strike Mulgore
    [90172] = true, -- Hunter Beast Mastery Westfall
    [90173] = true, -- Hunter Beast Mastery Darkshore
    [90174] = true, -- Hunter Beast Mastery Loch Modan
    [90175] = true, -- Hunter Beast Mastery Silverpine Forest
    [90176] = true, -- Hunter Beast Mastery The Barrens
    [90177] = true, -- Priest Shared Pain Dun Morogh
    [90178] = true, -- Priest Shared Pain Elwynn Forest
    [90179] = true, -- Priest Shared Pain Teldrassil
    [90180] = true, -- Priest Shared Pain Durotar
    [90181] = true, -- Priest Shared Pain Tirisfal Glades
    [90182] = true, -- Priest Homunculi Dun Morogh
    [90183] = true, -- Priest Homunculi Elwynn Forest
    [90184] = true, -- Priest Homunculi Teldrassil
    [90185] = true, -- Priest Homunculi Durotar
    [90186] = true, -- Priest Homunculi Tirisfal Glades
    [90187] = true, -- Priest Shadow Word: Death Westfall
    [90188] = true, -- Priest Shadow Word: Death The Barrens
    [90189] = true, -- Priest Shadow Word: Death Loch Modan
    [90190] = true, -- Priest Shadow Word: Death Silverpine Forest
    [90191] = true, -- Priest Shadow Word: Death Darkshore
    [90192] = true, -- Priest Circle of Healing Duskwood
    [90193] = true, -- Rogue Between the Eyes Ironforge
    [90194] = true, -- Rogue Between the Eyes Stormwind
    [90195] = true, -- Rogue Between the Eyes Orgrimmar
    [90196] = true, -- Rogue Between the Eyes Tirisfal Glades
    [90197] = true, -- Rogue Between the Eyes Teldrassil
    [90198] = true, -- Rogue Envenom Hillsbrad Foothills
    [90199] = true, -- Rogue Mutilate Teldrassil
    [90200] = true, -- Rogue Mutilate Dun Morogh
    [90201] = true, -- Rogue Shiv Duskwood
    [90202] = true, -- Shaman Shamanistic Rage Stonetalon Mountains
    [90203] = true, -- Shaman Way of Earth The Barrens
}

---@param questId number
---@return boolean
function QuestieDB.IsSoDRuneQuest(questId)
    return runeQuestsInSoD[questId]
end

-- This function blacklists any quests in phases LATER than the currentPhase value
-- so in Phase 1, quests in phases 2+ are blacklisted, in phase 2, phases 3+ are blacklisted, etc
-- Phase 1 is omitted, because everything not in this list is supposed to be available in Phase 1
local questsToBlacklistBySoDPhase = {
    [1] = { -- SoD Phase 1 - level cap 25 (this is required for counting, but should stay empty)
        [90008] = true, -- Hiding Regeneration for now as there are too many icons
        [90009] = true, -- Hiding Regeneration for now as there are too many icons
        [90010] = true, -- Hiding Enlightenment for now as there are too many icons
        [90011] = true, -- Hiding Enlightenment for now as there are too many icons
        [90015] = true, -- Hiding Living Flame for now as there are too many icons
        [90016] = true, -- Hiding Living Flame for now as there are too many icons
        [90017] = true, -- Hiding Living Flame for now as there are too many icons
        [90018] = true, -- Hiding Living Flame for now as there are too many icons
        [90020] = true, -- Hiding Living Bomb for now as there are too many icons
        [90021] = true, -- Hiding Living Bomb for now as there are too many icons
        [90023] = true, -- Hiding Druid Wild Strikes for now as there are too many icons
        [90036] = true, -- Hiding Warlock Master Channeler Westfall for now as there are too many icons
        [90085] = true, -- Hiding Loch Modan verion of Blade Dance for now as there are too many icons
        [90139] = true, -- Hiding Warrior Quick Strike Loch Modan for now as there are too many icons
        [90140] = true, -- Hiding Warrior Quick Strike Westfall for now as there are too many icons
        [90144] = true, -- Hiding Druid Savage Roar Westfall for now as there are too many icons
        [90145] = true, -- Hiding Druid Lacerate Darkshore for now as there are too many icons
        [90146] = true, -- Hiding Druid Mangle Mulgore for now as there are too many icons
        [90147] = true, -- Hiding Paladin Hand of Reckoning Westfall for now as there are too many icons
        [90148] = true, -- Hiding Paladin Exorcist Duskwood for now as there are too many icons
        [90157] = true, -- Hiding Priest Void Plague Teldrassil for now as there are too many icons
        [90155] = true, -- Hiding Priest Void Plague Dun Morogh for now as there are too many icons
        [90158] = true, -- Hiding Priest Void Plague Durotar for now as there are too many icons
        [90165] = true, -- Hiding Priest Twisted Faith The Barrens for now as there are too many icons
        [90169] = true, -- Hiding Priest Power Word: Barrier Redridge Mountains for now as there are too many icons
        [90173] = true, -- Hiding Hunter Beast Mastery Darkshore for now as there are too many icons
        [90175] = true, -- Hiding Hunter Beast Mastery Silverpine Forest for now as there are too many icons
        [90178] = true, -- Hiding Priest Shared Pain Elwynn Forest for now as there are too many icons
        [90181] = true, -- Hiding Priest Shared Pain Tirisfal Glades for now as there are too many icons
        [90182] = true, -- Hiding Priest Homunculi Dun Morogh for now as there are too many icons
        [90183] = true, -- Hiding Priest Homunculi Elwynn Forest for now as there are too many icons
        [90184] = true, -- Hiding Priest Homunculi Teldrassil for now as there are too many icons
        [90185] = true, -- Hiding Priest Homunculi Durotar for now as there are too many icons
        [90186] = true, -- Hiding Priest Homunculi Tirisfal Glades for now as there are too many icons
        [90192] = true, -- Hiding Priest Circle of Healing Duskwood for now as there are too many icons
        [90200] = true, -- Hiding Rogue Mutilate Dun Morogh for now as there are too many icons
        [90201] = true, -- Hiding Rogue Shiv Duskwood for now as there are too many icons
    },
    [2] = { -- SoD Phase 2 - level cap 40
        [1152] = true, -- Test of Lore; minLevel raised to 26 in P1 for some reason, might be retooled as part of P2?
        [1488] = true, -- The Corruptor; minLevel raised to 26 in P1
        [8370] = true, -- Conquering Arathi Basin
        [8374] = true, -- Conquering Arathi Basin
        [8171] = true, -- The Battle for Arathi Basin!
        [8168] = true, -- The Battle for Arathi Basin!
    },
    [3] = { -- SoD Phase 3 - level cap 50
    },
    [4] = { -- SoD Phase 4 - level cap 60
        -- These might not be re-added at level 60
        [6963] = true, -- Old "Stolen Winter Veil Treats" quest
        [6983] = true, -- Old "You're a Mean One..." quest
        [6984] = true, -- Old "A Smokywood Pastures Thank You!" quest
        [7042] = true, -- Old "Stolen Winter Veil Treats" quest
        [7043] = true, -- Old "You're a Mean One..." quest
        [7045] = true, -- Old "A Smokywood Pastures Thank You!" quest
        [7881] = true, -- Old "Carnival Boots"
        [7882] = true, -- Old "Carnival Jerkins"
        [7889] = true, -- Old "Coarse Weightstone"
        [7890] = true, -- Old "Heavy Grinding Stone"
        [7894] = true, -- Old "Copper Modulator"
        [7895] = true, -- Old "Whirring Bronze Gizmo"
        [7899] = true, -- Old "Small Furry Paws"
        [7900] = true, -- Old "Torn Bear Pelts"
        [8746] = true, -- Old "Metzen the Reindeer" quest
        [8762] = true, -- Old "Metzen the Reindeer" quest
    },
    [5] = { -- SoD Phase 5
    },
    [6] = { -- SoD Phase 6
    },
    [7] = { -- SoD Phase 7
    },
    [8] = { -- SoD Phase 8
    },
    [9] = { -- SoD Phase 9
    },
    [10] = { -- SoD Phase 10
    },
    [11] = { -- Era Phase 1 - MC, Ony
    },
    [12] = { -- Era Phase 2 - World Bosses
    },
    [13] = { -- Era Phase 3 - BWL + Darkmoon Faire
        [7761] = true, -- Blackhand's Command BWL pre quest
        [7787] = true,
        -- Darkmoon Faire quests
        [7902] = true,
        [7903] = true,
        [8222] = true,
        [7901] = true,
        [7899] = true,
        [7940] = true,
        [7900] = true,
        [7907] = true,
        [7927] = true,
        [7929] = true,
        [7928] = true,
        [7946] = true,
        [8223] = true,
        [7934] = true,
        [7981] = true,
        [7943] = true,
        [7894] = true,
        [7933] = true,
        [7898] = true,
        [7885] = true,
        [7942] = true,
        [7883] = true,
        [7892] = true,
        [7937] = true,
        [7939] = true,
        [7893] = true,
        [7891] = true,
        [7896] = true,
        [7884] = true,
        [7882] = true,
        [7897] = true,
        [7895] = true,
        [7941] = true,
        [7881] = true,
        [7890] = true,
        [7889] = true,
        [7945] = true,
        [7935] = true,
        [7938] = true,
        [7944] = true,
        [7932] = true,
        [7930] = true,
        [7931] = true,
        [7936] = true,
        [9249] = true,
        [10939] = true,
        [10940] = true,
        [10941] = true,
        -----------------
    },
    [14] = { -- Era Phase 4 - Zul'Gurub
        [8411] = true,
        [8056] = true,
        [8057] = true,
        [8064] = true,
        [8065] = true,
        [8074] = true,
        [8075] = true,
        [8110] = true,
        [8111] = true,
        [8112] = true,
        [8113] = true,
        [8116] = true,
        [8117] = true,
        [8118] = true,
        [8119] = true,
        [8041] = true,
        [8042] = true,
        [8043] = true,
        [8044] = true,
        [8045] = true,
        [8046] = true,
        [8047] = true,
        [8048] = true,
        [8049] = true,
        [8050] = true,
        [8051] = true,
        [8052] = true,
        [8053] = true,
        [8054] = true,
        [8055] = true,
        [8058] = true,
        [8059] = true,
        [8060] = true,
        [8061] = true,
        [8062] = true,
        [8063] = true,
        [8066] = true,
        [8067] = true,
        [8068] = true,
        [8069] = true,
        [8070] = true,
        [8071] = true,
        [8072] = true,
        [8073] = true,
        [8076] = true,
        [8077] = true,
        [8078] = true,
        [8079] = true,
        [8101] = true,
        [8102] = true,
        [8103] = true,
        [8104] = true,
        [8106] = true,
        [8107] = true,
        [8108] = true,
        [8109] = true,
        [8141] = true,
        [8142] = true,
        [8143] = true,
        [8144] = true,
        [8145] = true,
        [8146] = true,
        [8147] = true,
        [8148] = true,
        [8184] = true,
        [8185] = true,
        [8186] = true,
        [8187] = true,
        [8188] = true,
        [8189] = true,
        [8190] = true,
        [8191] = true,
        [8192] = true,
        [8195] = true,
        [8196] = true,
        [8201] = true,
        [8227] = true,
        [8238] = true,
        [8239] = true,
        [8240] = true,
        [8243] = true,
        [8246] = true,
        [8446] = true,
        [8447] = true,
        [9208] = true,
        [9209] = true,
        [9210] = true,
        [8307] = true,
        [8313] = true,
        [8317] = true,
        [8282] = true,
        [8278] = true,
        [8323] = true,
        [8324] = true,
        [8275] = true,
        [8309] = true,
        [8310] = true,
        [8315] = true,
        [8319] = true,
        [8341] = true,
        [8342] = true,
        [8343] = true,
        [8331] = true,
        [8332] = true,
        [8333] = true,
        [8306] = true,
        [8321] = true,
        [8362] = true,
        [8364] = true,
        [9248] = true,
        [8281] = true,
        [8285] = true,
        [8279] = true,
        [8287] = true,
        [8314] = true,
    },
    [15] = { -- Era Phase 5 - AQ
        [8277] = true,
        [8280] = true,
        [8283] = true,
        [8284] = true,
        [8304] = true,
        [8318] = true,
        [8320] = true,
        [8361] = true,
        [8276] = true,
        [8747] = true,
        [8748] = true,
        [8749] = true,
        [8750] = true,
        [8752] = true,
        [8753] = true,
        [8754] = true,
        [8755] = true,
        [8757] = true,
        [8758] = true,
        [8759] = true,
        [8760] = true,
        [8800] = true,
        [8751] = true,
        [8756] = true,
        [8761] = true,
        [8801] = true,
        [8802] = true,
        [8764] = true,
        [8765] = true,
        [8766] = true,
        [8620] = true,
        [8621] = true,
        [8622] = true,
        [8623] = true,
        [8624] = true,
        [8625] = true,
        [8626] = true,
        [8627] = true,
        [8628] = true,
        [8629] = true,
        [8630] = true,
        [8631] = true,
        [8632] = true,
        [8633] = true,
        [8634] = true,
        [8637] = true,
        [8638] = true,
        [8639] = true,
        [8640] = true,
        [8641] = true,
        [8655] = true,
        [8656] = true,
        [8657] = true,
        [8658] = true,
        [8659] = true,
        [8660] = true,
        [8661] = true,
        [8662] = true,
        [8663] = true,
        [8664] = true,
        [8665] = true,
        [8666] = true,
        [8667] = true,
        [8668] = true,
        [8669] = true,
        [8689] = true,
        [8690] = true,
        [8691] = true,
        [8692] = true,
        [8693] = true,
        [8694] = true,
        [8695] = true,
        [8696] = true,
        [8697] = true,
        [8698] = true,
        [8699] = true,
        [8700] = true,
        [8701] = true,
        [8702] = true,
        [8703] = true,
        [8704] = true,
        [8705] = true,
        [8706] = true,
        [8707] = true,
        [8708] = true,
        [8709] = true,
        [8710] = true,
        [8711] = true,
        [8712] = true,
        [8728] = true,
        [8729] = true,
        [8730] = true,
        [8733] = true,
        [8734] = true,
        [8735] = true,
        [8736] = true,
        [8741] = true,
        [8742] = true,
        [8743] = true,
        [8745] = true,
        [8783] = true,
        [8784] = true,
        [8789] = true,
        [8790] = true,
        [8791] = true,
        [8602] = true,
        [8603] = true,
        [8606] = true,
        [8592] = true,
        [8593] = true,
        [8594] = true,
        [8595] = true,
        [8596] = true,
        [8597] = true,
        [8598] = true,
        [8599] = true,
        [8584] = true,
        [8585] = true,
        [8586] = true,
        [8587] = true,
        [8555] = true,
        [8556] = true,
        [8557] = true,
        [8558] = true,
        [8559] = true,
        [8560] = true,
        [8561] = true,
        [8562] = true,
        [8572] = true,
        [8573] = true,
        [8574] = true,
        [8575] = true,
        [8576] = true,
        [8577] = true,
        [8578] = true,
        [8496] = true,
        [8579] = true,
        [8544] = true,
        [8519] = true,
        [8856] = true,
        [8829] = true,
        [8497] = true,
        [8804] = true,
        [8805] = true,
        [8536] = true,
        [8857] = true,
        [8498] = true,
        [8806] = true,
        [8308] = true,
        [8858] = true,
        [8859] = true,
        [8807] = true,
        [8771] = true,
        [8773] = true,
        [8775] = true,
        [8777] = true,
        [8809] = true,
        [8787] = true,
        [8785] = true,
        [8538] = true,
        [8534] = true,
        [8738] = true,
        [8502] = true,
        [8537] = true,
        [8539] = true,
        [8786] = true,
        [8737] = true,
        [8687] = true,
        [8739] = true,
        [8501] = true,
        [8535] = true,
        [8808] = true,
        [8810] = true,
        [8740] = true,
        [8381] = true,
        [8779] = true,
        [8540] = true,
        [8541] = true,
        [8778] = true,
        [8780] = true,
        [8781] = true,
        [8782] = true,
        [8770] = true,
        [8772] = true,
        [8774] = true,
        [8776] = true,
        [8316] = true,
        [9023] = true,
        [8382] = true,
        [8286] = true,
        [8288] = true,
        [8301] = true,
        [8302] = true,
        [8303] = true,
        [8305] = true,
        [8548] = true,
        [8818] = true,
        [8817] = true,
        [8816] = true,
        [8815] = true,
        [8814] = true,
        [8820] = true,
        [8826] = true,
        [8825] = true,
        [8824] = true,
        [8823] = true,
        [8822] = true,
        [8821] = true,
        [8819] = true,
    },
    [16] = { -- Era Phase 6 - Naxxramas
        [9085] = true,
        [9142] = true,
        [9165] = true,
        [9141] = true,
        [9033] = true,
        [9034] = true,
        [9036] = true,
        [9037] = true,
        [9038] = true,
        [9039] = true,
        [9040] = true,
        [9041] = true,
        [9042] = true,
        [9043] = true,
        [9044] = true,
        [9045] = true,
        [9046] = true,
        [9047] = true,
        [9048] = true,
        [9049] = true,
        [9050] = true,
        [9054] = true,
        [9055] = true,
        [9056] = true,
        [9057] = true,
        [9058] = true,
        [9059] = true,
        [9060] = true,
        [9061] = true,
        [9068] = true,
        [9069] = true,
        [9070] = true,
        [9071] = true,
        [9072] = true,
        [9073] = true,
        [9074] = true,
        [9075] = true,
        [9077] = true,
        [9078] = true,
        [9079] = true,
        [9080] = true,
        [9081] = true,
        [9082] = true,
        [9083] = true,
        [9084] = true,
        [9086] = true,
        [9087] = true,
        [9088] = true,
        [9089] = true,
        [9090] = true,
        [9091] = true,
        [9092] = true,
        [9093] = true,
        [9095] = true,
        [9096] = true,
        [9097] = true,
        [9098] = true,
        [9099] = true,
        [9100] = true,
        [9101] = true,
        [9102] = true,
        [9103] = true,
        [9104] = true,
        [9105] = true,
        [9106] = true,
        [9107] = true,
        [9108] = true,
        [9109] = true,
        [9110] = true,
        [9111] = true,
        [9112] = true,
        [9113] = true,
        [9114] = true,
        [9115] = true,
        [9116] = true,
        [9117] = true,
        [9118] = true,
        [9120] = true,
        [9121] = true,
        [9122] = true,
        [9123] = true,
        [9124] = true,
        [9125] = true,
        [9126] = true,
        [9127] = true,
        [9128] = true,
        [9129] = true,
        [9131] = true,
        [9132] = true,
        [9136] = true,
        [9137] = true,
        [9153] = true,
        [9211] = true,
        [9213] = true,
        [9221] = true,
        [9222] = true,
        [9223] = true,
        [9224] = true,
        [9225] = true,
        [9226] = true,
        [9227] = true,
        [9228] = true,
        [9229] = true,
        [9230] = true,
        [9232] = true,
        [9233] = true,
        [9234] = true,
        [9235] = true,
        [9236] = true,
        [9237] = true,
        [9238] = true,
        [9239] = true,
        [9240] = true,
        [9241] = true,
        [9242] = true,
        [9243] = true,
        [9244] = true,
        [9245] = true,
        [9246] = true,
        [9250] = true,
        [9251] = true,
        -- Silithus/EPL PvP
        [9248] = true,
        [9422] = true,
        [9415] = true,
        [9419] = true,
        [9416] = true,
    },
    [17] = { -- Never appearing in Season of Discovery
    -- Original Blackfathom Deeps quests (instance reworked to raid, new quest IDs)
    [909] = true,
    [971] = true,
    [1198] = true,
    [1199] = true,
    [1200] = true,
    [1275] = true,
    [6561] = true,
    [6565] = true,
    [6921] = true,
    [6922] = true,

    -- Original Gnomeregan quests (instance reworked to raid, new quest IDs)
    [2841] = true,
    [2842] = true,
    [2843] = true,
    [2904] = true,
    [2922] = true,
    [2923] = true,
    [2924] = true,
    [2925] = true,
    [2926] = true,
    [2927] = true,
    [2928] = true,
    [2929] = true,
    [2930] = true,
    [2931] = true,
    [2945] = true,
    [2947] = true,
    [2949] = true,
    [2951] = true,
    [2952] = true,
    [2953] = true,
    [2962] = true,
    [4601] = true,
    [4602] = true,
    [4603] = true,
    [4604] = true,
    [4605] = true,
    [4606] = true,

    -- Original Scarlet Monastery quests (instance reworked to raid, new quest IDs)
    [1048] = true,
    [1049] = true,
    [1050] = true,
    [1051] = true,
    [1052] = true,
    [1053] = true,
    [1113] = true,
    [1160] = true,
    },
}

---@return table<number, table<number, boolean>> @All quests that should be blacklisted separated by phase
function QuestieQuestBlacklist:GetSoDQuestsToBlacklist()
    -- "automatic" phase detection for the first few phases;
    -- gets called slightly later into init because if GetMaxPlayerLevel() is called too
    -- early after initial login (not reloads), the game returns 60 even in early phases
    local maxLevel = GetMaxPlayerLevel()
    local phaseChanged = true
    if maxLevel == 25 then
        SeasonOfDiscovery.currentPhase = 1
    elseif maxLevel == 40 then
        SeasonOfDiscovery.currentPhase = 2
    elseif maxLevel == 50 then
        SeasonOfDiscovery.currentPhase = 3
    elseif maxLevel == 60 and SeasonOfDiscovery.currentPhase < 4 then
        SeasonOfDiscovery.currentPhase = 4
    else
        phaseChanged = false
        Questie:Debug(Questie.DEBUG_INFO, "[SeasonOfDiscovery] Automatic phase detection failed, phase remains as " .. tostring(SeasonOfDiscovery.currentPhase))
    end
    if phaseChanged == true then Questie:Debug(Questie.DEBUG_INFO, "[SeasonOfDiscovery] Phase automatically detected as " .. tostring(SeasonOfDiscovery.currentPhase)) end
    -- Even if the first phase technically has no quests to blacklist, we use this be able to temporarily blacklist quests in P1
    if SeasonOfDiscovery.currentPhase > 1 then
        for phase = 1, SeasonOfDiscovery.currentPhase do
            questsToBlacklistBySoDPhase[phase] = {} -- empty table instead of nil to keep table size
        end
    end
    return questsToBlacklistBySoDPhase
end
