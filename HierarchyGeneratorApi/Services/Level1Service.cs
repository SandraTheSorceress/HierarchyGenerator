using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level1Service : ILevel1Service
{
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
                    sb.Append($"{l1.Id},{l1.Name},,{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l1.Id},{l1.Name},,");
                sb.Append(Environment.NewLine);
            }

        }

        return sb.ToString();
    }
}
