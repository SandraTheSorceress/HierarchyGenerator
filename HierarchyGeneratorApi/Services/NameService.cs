using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Repositories;
using System;

namespace HierarchyGeneratorApi.Services;

public class NameService : INameService
{
    private readonly Random random = new Random();
    private readonly INameRepository _nameRepository;

    public NameService(INameRepository nameRepository)
    {
        _nameRepository = nameRepository;
    }

    public List<string> GenerateL1PlaceNames(Theme theme, int numberOfNames)
    {
        
        List<string> placeNames = GeneratePlaceNames(theme, numberOfNames);

        List<string> placeNamesWithTitles = DecorateWithL1Title(theme, placeNames);

        List<string> placeNamesWithTitlesAndAdjectives = DecorateWithL1Adjective(theme, placeNamesWithTitles);

        return placeNamesWithTitlesAndAdjectives;

    }

    private List<string> DecorateWithL1Adjective(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithAdjectives = new List<string>();
        List<string> adjectives = new List<string>
        {
            "Elven", "Dwarven", "Orcish", "Gnomish", "Halfling", "Human", "Draconic", "Tiefling", "Goblin", "Hobgoblin",
            "Kobold", "Trollkin", "Ogre", "Fey", "Sylvan", "Celestial", "Fiendish", "Elemental", "Djinn", "Efreeti",
            "Aarakocra", "Minotaur", "Satyr", "Triton", "Merfolk", "Undead", "Vampiric", "Lichborne", "Ghoul", "Revenant",
            "Skeleton", "Wight", "Golem", "Constructed", "Warforged", "Changeling", "Shifter", "Tabaxi", "Kenku", "Lizardfolk",
            "Yuan-ti", "Genasi", "Bugbear", "Myconid", "Dryadic", "Nymphic", "Druidic", "Archfey", "Infernal", "Abyssal",
            "Trollborn", "Lycanthropic", "Werewolf", "Weretiger", "Centaurian", "Phoenixborn", "Dragonborn", "Sea Elf", "High Elf", "Wood Elf",
            "Dark Elf", "Drow", "Stone Dwarf", "Hill Dwarf", "Mountain Dwarf", "Blood Elf", "Fire Elf", "Moon Elf", "Sun Elf", "Frost Elf",
            "Cloud Giant", "Storm Giant", "Fire Giant", "Frost Giant", "Hill Giant", "Titanic", "Eldritch", "Ancient One", "Runeborn", "Starspawn",
            "Aetherial", "Shadowkin", "Shade", "Dhampir", "Necrid", "Arcani", "Planar", "Voidwalker", "Spectral", "Wisp",
            "Beastkin", "Feral", "Felborn", "Demonic", "Celestian", "Astral", "Primal", "Tideborn", "Sand Elf", "Skyfolk",
            "Stonekin", "Glacial", "Ashenborn", "Runic", "Feytouched", "Thornborn", "Ironblood", "Stormtouched", "Snowborn", "Windborne",
            "Glorious", "Eternal", "Majestic", "Fabled", "Divine", "Mystic", "Sacred", "Vast",
            "Radiant", "Infinite", "Ancient", "Epic", "Timeless", "Grand", "Sovereign", "Celestial",
            "Wondrous", "Celestial", "Noble", "Shining", "Resplendent", "Serene", "Mighty", "Royal",
            "Unyielding", "Fierce", "Imposing", "Luminous", "Legendary", "Mysterious", "Enchanted",
            "Glittering", "Fierce", "Boundless", "Unseen", "Wicked", "Resilient", "Illustrious", "Revered",
            "Endless", "Venerated", "Chivalrous", "Bountiful", "Unfathomable", "Whispering", "Golden",
            "Dark", "Noble", "Indomitable", "Sacred", "Powerful", "Unconquered", "Starlit",
            "Ethereal", "Majestic", "Frosted", "Dragonborn", "Blessed", "Haunted", "Obsidian", "Tangled",
            "Timeless", "Flame-touched", "Oblivion", "Silent", "Arcane", "Storm-wrought", "Blood-soaked",
            "Unrivaled", "Mournful", "Bitter", "Forgotten", "Stormy", "Flame-born", "Shadowed", "Frozen",
            "Searing", "Enduring", "Wicked", "Haunting", "Vengeful", "Twilight", "Glittering", "Infernal",
            "Twisting", "Ancient", "Unbroken", "Relentless", "Vast", "Unseen", "Twinkling", "Crimson",
            "Goblin", "Elven", "Dwarven", "Dragon", "Arcane", "Fiery", "Moonlit", "Witchborn", "Shadow",
            "Beastly", "Ancient", "Frost-wrought", "Silvered", "Crimson", "Wyrm", "Grim", "Stormborn",
            "Darkwood", "Wild", "Bane", "Demonborn", "Hellfire", "Venomous", "Bloodthirsty", "Ominous",
            "Forsaken", "Mournful", "Grim", "Royal", "Briar", "Ironclad", "Seraphic", "Wicked", "Sun-kissed",
            "Searing", "Diamond", "Seraphic", "Doomed", "Feathered", "Sunlit", "Thunderstruck", "Frostbitten",
            "Cursed", "Whispering", "Wraith", "Cavernous", "Shattered", "Raging", "Unbroken", "Glooming",
            "Vengeful", "Violet", "Steel-wrought", "Frost-bound", "Brimstone", "Rustic", "Ancientwood", "Vengeful",
            "Glistening", "Shadowmourn", "Moonshrouded", "Torn", "Unholy", "Dread", "Mist-shrouded", "Bloodclad",
            "Hallowed", "Shattered", "Raven", "Eclipsed", "Voidborn", "Silverclad", "Dreadwrought", "Sunshadowed",
            "Misty", "Starry", "Torn", "Shattered", "Wrathful", "Searing", "Cinder", "Doomstruck", "Gloomclad",
            "Omen", "Wyrmgold", "Windborn", "Frostforged", "Petrified", "Flameclad", "Terror-wrought", "Stoneborn",
            "Ashen", "Gravebound", "Tidal", "Silvershade", "Ether-bound", "Flamelit", "Lifeless", "Blackened",
            "Doomclad", "Wyrmclad", "Sable", "Silver-touched", "Starlit", "Thunderscourged", "Seaswept"
        };

        foreach (var placeName in placeNames)
        {
            string adjective = adjectives[random.Next(adjectives.Count)];
            placeNamesWithAdjectives.Add($"{adjective} {placeName}");
        }
        return placeNamesWithAdjectives;
    }

    private List<string> DecorateWithL1Title(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithTitles = new List<string>();
        List<string> titles = new List<string> { "realm of", "kingdom of", "dominion of", "empire of", "sovereignty of", "lands of" };
        foreach (var placeName in placeNames)
        {
            string title = titles[random.Next(titles.Count)];
            placeNamesWithTitles.Add($"{title} {placeName}");
        }
        return placeNamesWithTitles;
    }

    private List<string> GeneratePlaceNames(Theme theme, int numberOfNames)
    {
        HashSet<string> placeNames = new HashSet<string>();
        List<string> startingPhonemes = _nameRepository.GetStartingPhonemesForPlace(theme);
        List<string> middlePhonemes = _nameRepository.GetMiddlePhonemesForPlace(theme);
        List<string> endingPhonemes = _nameRepository.GetEndingPhonemesForPlace(theme);

        for (int i = 0; i < numberOfNames; i++)
        {
            string randomName;
            do
            {
                string start = startingPhonemes[random.Next(startingPhonemes.Count)];
                string middle = middlePhonemes[random.Next(middlePhonemes.Count)];
                string end = endingPhonemes[random.Next(endingPhonemes.Count)];

                randomName = start + middle + end;
            } while (placeNames.Contains(randomName));
            placeNames.Add(randomName);

        }

        return placeNames.ToList();
    }
}
