using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level4Service : ILevel4Service
{
    private readonly ILevel5Service _level5Service;
    public Level4Service(ILevel5Service level5Service)
    {
        _level5Service = level5Service;
    }
    public string GetCSV(int L3NodeId, List<L4> l4s)
    {
        StringBuilder sb = new StringBuilder();
        foreach (var l4 in l4s)
        {
            if (l4.Contacts.Any())
            {
                foreach (var contact in l4.Contacts)
                {
                    sb.Append($"{l4.NodeId},{l4.Name},{L3NodeId},{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l4.NodeId},{l4.Name},{L3NodeId},");
                sb.Append(Environment.NewLine);
            }
            var l5 = _level5Service.GetCSV(l4.NodeId, l4.L5s);
            sb.Append(l5);

        }

        return sb.ToString();
    }
}
