using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level5Service : ILevel5Service
{
    private readonly INameService _nameService;
    private readonly INodeCountService _nodeCountService;
    public Level5Service(INameService nameService, INodeCountService nodeCountService)
    {
        _nameService = nameService;
        _nodeCountService = nodeCountService;
    }

    public List<L5> GenerateL5s(CreateHierarchyParameters parameters)
    {
        int numberOfNodes = _nodeCountService.GetNumberOfNodes(parameters.L5);
        List<string> names = _nameService.GenerateL5PlaceNames(parameters.Theme, numberOfNodes);

        List<L5> l5s = new();
        foreach (var name in names)
        {

            L5 l5 = new()
            {
                NodeId = _nodeCountService.GetNextNodeId(),
                Name = name,
            };
            l5s.Add(l5);
        }
        return l5s;
    }

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
