using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level2Service : ILevel2Service
{
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
            

        }

        return sb.ToString();
    }
}
