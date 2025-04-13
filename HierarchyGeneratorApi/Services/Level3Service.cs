using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level3Service : ILevel3Service
{
    public string GetCSV(int L1NodeId, List<L3> l3s)
    {
        StringBuilder sb = new StringBuilder();
        foreach (var l3 in l3s)
        {
            if (l3.Contacts.Any())
            {
                foreach (var contact in l3.Contacts)
                {
                    sb.Append($"{l3.NodeId},{l3.Name},{L1NodeId},{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l3.NodeId},{l3.Name},{L1NodeId},");
                sb.Append(Environment.NewLine);
            }
            

        }

        return sb.ToString();
    }
}
