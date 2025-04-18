using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level4Service : ILevel4Service
{
    private readonly ILevel5Service _level5Service;
    private readonly INameService _nameService;
    private readonly INodeCountService _nodeCountService;
    public Level4Service(ILevel5Service level5Service, INameService nameService, INodeCountService nodeCountService)
    {
        _level5Service = level5Service;
        _nameService = nameService;
        _nodeCountService = nodeCountService;
    }

    public List<L4> GenerateL4s(CreateHierarchyParameters parameters)
    {
        int numberOfNodes = _nodeCountService.GetNumberOfNodes(parameters.L4);
        List<string> names = _nameService.GenerateL4PlaceNames(parameters.Theme, numberOfNodes);

        List<L4> l4s = new();
        foreach (var name in names)
        {

            L4 l4 = new()
            {
                NodeId = _nodeCountService.GetNextNodeId(),
                Name = name,
            };
            List<L5> L5s = _level5Service.GenerateL5s(parameters);
            l4.L5s = L5s;
            l4s.Add(l4);
        }
        return l4s;
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
