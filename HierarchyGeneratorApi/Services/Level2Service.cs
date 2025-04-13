using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level2Service : ILevel2Service
{

    private readonly ILevel3Service _level3Service;

    public Level2Service(ILevel3Service level3Service)
    {
        _level3Service = level3Service;
    }

    public string GetCSV(int L1NodeId, List<L2> l2s)
    {
        StringBuilder sb = new StringBuilder();
        foreach (var l2 in l2s)
        {
            if (l2.Contacts.Any())
            {
                foreach (var contact in l2.Contacts)
                {
                    sb.Append($"{l2.NodeId},{l2.Name},{L1NodeId},{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l2.NodeId},{l2.Name},{L1NodeId},");
                sb.Append(Environment.NewLine);
            }
            var l3 = _level3Service.GetCSV(l2.NodeId, l2.L3s);
            sb.Append(l3);

        }

        return sb.ToString();
    }
}
