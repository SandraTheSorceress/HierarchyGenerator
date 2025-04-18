using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level3Service : ILevel3Service
{
    private readonly ILevel4Service _level4Service;
    private readonly INameService _nameService;
    private readonly INodeCountService _nodeCountService;
    public Level3Service(ILevel4Service level4Service, INameService nameService, INodeCountService nodeCountService)
    {
        _level4Service = level4Service;
        _nameService = nameService;
        _nodeCountService = nodeCountService;
    }

    public List<L3> GenerateL3s(CreateHierarchyParameters parameters)
    {
        int numberOfNodes = _nodeCountService.GetNumberOfNodes(parameters.L3);
        List<string> names = _nameService.GenerateL3PlaceNames(parameters.Theme, numberOfNodes);

        List<L3> l3s = new();
        foreach (var name in names)
        {

            L3 l3 = new()
            {
                NodeId = _nodeCountService.GetNextNodeId(),
                Name = name,
            };
            List<L4> L4s = _level4Service.GenerateL4s(parameters);
            l3.L4s = L4s;
            l3s.Add(l3);
        }
        return l3s;
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
