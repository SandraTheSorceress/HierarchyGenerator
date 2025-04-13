using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level5Service : ILevel5Service
{
    public string GetCSV(int L4NodeId, List<L5> l5s)
    {
        StringBuilder sb = new StringBuilder();
        foreach (var l5 in l5s)
        {
            if (l5.Contacts.Any())
            {
                foreach (var contact in l5.Contacts)
                {
                    sb.Append($"{l5.NodeId},{l5.Name},{L4NodeId},{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l5.NodeId},{l5.Name},{L4NodeId},");
                sb.Append(Environment.NewLine);
            }
            

        }

        return sb.ToString();
    }
}
