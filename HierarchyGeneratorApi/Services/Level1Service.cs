using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using System;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class Level1Service : ILevel1Service
{
    private readonly ILevel2Service _level2Service;

    public Level1Service(ILevel2Service level2Service)
    {
        _level2Service = level2Service;
    }

    public List<L1> GenerateL1s(CreateHierarchyParameters parameters)
    {
        int minNumberOfNodes, maxNumberOfNodes;
        switch (parameters.L1)
        {
            case L1Option.A_FEW:
                minNumberOfNodes = 1;
                maxNumberOfNodes = 3;
                break;
            case L1Option.SOME:
                minNumberOfNodes = 4;
                maxNumberOfNodes = 7;
                break;
            case L1Option.SURPRISE_ME:
                minNumberOfNodes = 1;
                maxNumberOfNodes = 7;
                break;
            default:
                throw new ArgumentException("Unsupported L1 option");
        }
        Random random = new Random();
        int numberOfNodes = random.Next(minNumberOfNodes, maxNumberOfNodes);

        List<L1> l1s = new List<L1>();
        for (int i = 0; i < numberOfNodes; i++)
        {
            L1 l1 = new L1()
            {
                NodeId = i,
                Name = $"My L1 Node {i}"
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
