using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using System;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level1Service : ILevel1Service
{

    private readonly ILevel2Service _level2Service;
    private readonly INameService _nameService;
    private readonly INodeCountService _nodeCountService;

    public Level1Service(ILevel2Service level2Service, INameService nameService, INodeCountService nodeCountService)
    {
        _level2Service = level2Service;
        _nameService = nameService;
        _nodeCountService = nodeCountService;
    }

    public List<L1> GenerateL1s(CreateHierarchyParameters parameters)
    {
        int numberOfNodes = _nodeCountService.GetNumberOfNodes(parameters.L1);
        List<string> names = _nameService.GenerateL1PlaceNames(parameters.Theme, numberOfNodes);

        List<L1> l1s = new List<L1>();
        int nodeId = 1;
        foreach (var name in names)
        {
            L1 l1 = new L1()
            {
                NodeId = nodeId++,
                Name = name,
            };
            l1s.Add(l1);
        }
        return l1s;
    }

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
                    sb.Append($"{l1.NodeId},{l1.Name},,{contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            }
            else
            {
                sb.Append($"{l1.NodeId},{l1.Name},,");
                sb.Append(Environment.NewLine);
            }
            var l2 = _level2Service.GetCSV(l1.NodeId, l1.L2s);
            sb.Append(l2);

        }

        return sb.ToString();
    }
}
