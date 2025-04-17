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

    public Level1Service(ILevel2Service level2Service)
    {
        _level2Service = level2Service;
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

        List<string> startingPhonemes = new List<string>
        {
            "Ar", "Thal", "Vor", "Kael", "Al", "Riv", "Toran", "Valth", "El", "Zar",
            "Cor", "Syl", "Dra", "Ith", "Mord", "Ner", "Rha", "Lor", "Hald", "Fael",
            "Vyr", "Kal", "Ber", "Zeth", "Eld", "Gor", "Tir", "Sal", "Rys", "Fenn",
            "Khor", "Dyl", "Shal", "Ryn", "Oran", "Cail", "Zel", "Vael", "Ald", "Thir",
            "Fel", "Lorn", "Vren", "Glan", "Nir", "Tor", "Aran", "Jor", "Harn", "Myl",
            "Ari", "Zar", "Tor", "Var", "Kiel", "Dren", "Sil", "Dorn", "Har", "Alth",
            "Nir", "Elor", "Raen", "Vorth", "Tarn", "Khal", "Zel", "Lorn", "Var", "Ral",
            "Hran", "Sith", "Mel", "Dorin", "Vath", "Frel", "Kel", "Marth", "Bryn", "Lir",
            "Kael", "Draen", "Thar", "Sian", "Rein", "Kor", "Dros", "Viran", "Far", "Krin",
            "Zar", "Lar", "Jol", "Khor", "Bhal", "Fal", "Tor", "Vin", "Ari", "Mal"
        };

        List<string> middlePhonemes = new List<string>
        {
            "en", "or", "ai", "ul", "ar", "ol", "an", "or", "el", "ir",
            "al", "il", "yn", "er", "ur", "om", "ir", "il", "en", "ar",
            "es", "as", "os", "ai", "ew", "oy", "ay", "ee", "ai", "au",
            "oo", "ei", "ua", "ou", "ia", "ei", "ie", "ae", "ea", "ou",
            "ya", "yo", "zu", "ze", "za", "zi", "ri", "ka", "li", "mi",
            "on", "en", "in", "yn", "or", "ul", "an", "ian", "eil", "ail",
            "il", "ul", "ol", "ir", "ur", "on", "et", "at", "ot", "in",
            "ai", "au", "io", "ui", "ea", "ia", "oi", "oy", "ai", "ia",
            "ar", "or", "ul", "il", "el", "al", "en", "an", "yn", "er",
            "om", "ar", "il", "en", "ra", "or", "ri", "ur", "ul", "ei",
            "ia", "ae", "ie", "ou", "ay", "ua", "io", "ea", "oi", "ei"
        };

        List<string> endingPhonemes = new List<string>
        {
            "dor", "heim", "spire", "thal", "drak", "orim", "dun", "ril", "sor", "gor",
            "nath", "ilith", "mar", "morn", "ros", "dar", "tar", "vel", "lon", "thar",
            "resh", "vorn", "lith", "ir", "sair", "din", "aric", "mith", "sil", "ran",
            "thos", "gar", "shar", "tash", "raen", "lore", "han", "torr", "bael", "rak",
            "win", "aeon", "val", "ris", "bri", "zan", "all", "kael", "sol", "len",
            "mir", "lor", "zael", "dol", "shin", "kan", "rin", "san", "ran", "tor",
            "hal", "lar", "dir", "nor", "ven", "lir", "mor", "val", "kar", "mar",
            "nar", "sar", "dal", "zir", "ray", "vear", "zel", "sol", "ryl", "thal",
            "mir", "hal", "vin", "vil", "lir", "ser", "lar", "kar", "tol", "zar",
            "nel", "mir", "hel", "ral", "mon", "lon", "sel", "dan", "kel", "rol"
        };

        List<string> titles = new List<string> { "Realm of", "Kingdom of", "Dominion of", "Empire of", "Sovereignty of", "Lands of" };

        List<string> adjectives = new List<string>
        {
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
            "Twisting", "Ancient", "Unbroken", "Relentless", "Vast", "Unseen", "Twinkling", "Crimson"
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
