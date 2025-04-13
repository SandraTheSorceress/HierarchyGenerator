using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level3Service : ILevel3Service
{
    private readonly ILevel4Service _level4Service;
    public Level3Service(ILevel4Service level4Service)
    {
        _level4Service = level4Service;
    }
    public string GetCSV(int L2NodeId, List<L3> l3s)
    {
        StringBuilder sb = new StringBuilder();
        foreach (var l3 in l3s)
        {
            if (l3.Contacts.Any())
            {
                foreach (var contact in l3.Contacts)
                {
                    sb.Append($"{l3.NodeId},{l3.Name},{L2NodeId},{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l3.NodeId},{l3.Name},{L2NodeId},");
                sb.Append(Environment.NewLine);
            }
            var l4 = _level4Service.GetCSV(l3.NodeId, l3.L4s);
            sb.Append(l4);
        }

        return sb.ToString();
    }
}
