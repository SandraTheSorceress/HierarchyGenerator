using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using System;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level1Service : ILevel1Service
{
    private readonly Random random = new Random();
    private readonly ILevel2Service _level2Service;
    private readonly INameRepository _nameRepository;

    public Level1Service(ILevel2Service level2Service, INameRepository nameRepository)
    {
        _level2Service = level2Service;
        _nameRepository = nameRepository;
    }

    public List<L1> GenerateL1s(CreateHierarchyParameters parameters)
    {
        int minNumberOfNodes, maxNumberOfNodes;
        switch (parameters.L1)
        {
            case L1Option.A_FEW:
                minNumberOfNodes = 1;
                maxNumberOfNodes = 3;
                break;
            case L1Option.SOME:
                minNumberOfNodes = 4;
                maxNumberOfNodes = 7;
                break;
            case L1Option.SURPRISE_ME:
                minNumberOfNodes = 1;
                maxNumberOfNodes = 7;
                break;
            default:
                throw new ArgumentException("Unsupported L1 option");
        }
        int numberOfNodes = random.Next(minNumberOfNodes, maxNumberOfNodes);
        List<string> names = GenerateNames(numberOfNodes, parameters.Theme);

        List<L1> l1s = new List<L1>();
        int nodeId = 1;
        foreach (var name in names)
        {
            L1 l1 = new L1()
            {
                NodeId = nodeId++,
                Name = name,
            };
            l1s.Add(l1);
        }
        return l1s;
    }

    private List<string> GenerateNames(int numberOfNodes, Theme theme)
    {
        HashSet<string> generatedNames = new HashSet<string>();

        List<string> startingPhonemes = _nameRepository.GetStartingPhonemesForPlace(theme);

        List<string> middlePhonemes = _nameRepository.GetMiddlePhonemesForPlace(theme);

        List<string> endingPhonemes = _nameRepository.GetEndingPhonemesForPlace(theme);

        List<string> titles = new List<string> { "realm of", "kingdom of", "dominion of", "empire of", "sovereignty of", "lands of" };

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


        for (int i = 0; i < numberOfNodes; i++)
        {
            string randomName;
            do
            {
                string start = startingPhonemes[random.Next(startingPhonemes.Count)];
                string middle = middlePhonemes[random.Next(middlePhonemes.Count)];
                string end = endingPhonemes[random.Next(endingPhonemes.Count)];

                randomName = start + middle + end;
            } while (generatedNames.Contains(randomName));

            string adjective = adjectives[random.Next(adjectives.Count)];
            string title = titles[random.Next(titles.Count)];
            
            generatedNames.Add($"{adjective} {title} {randomName}");
        }


        return generatedNames.ToList();
    }

    public string GetCSV(List<L1> l1s)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("NodeId,NodeLabel,ParentId,ContactId");
        sb.Append(Environment.NewLine);
        foreach (var l1 in l1s)
        {
            if (l1.Contacts.Any())
            {
                foreach (var contact in l1.Contacts)
                {
                    sb.Append($"{l1.NodeId},{l1.Name},,{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l1.NodeId},{l1.Name},,");
                sb.Append(Environment.NewLine);
            }
            var l2 = _level2Service.GetCSV(l1.NodeId, l1.L2s);
            sb.Append(l2);

        }

        return sb.ToString();
    }
}
