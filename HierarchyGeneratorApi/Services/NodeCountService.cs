using HierarchyGeneratorApi.DTOs;
using System;

namespace HierarchyGeneratorApi.Services;

public class NodeCountService : INodeCountService
{
    private readonly Random random = new Random();
    public int GetNumberOfNodes(L1Option option)
    {
        int minNumberOfNodes, maxNumberOfNodes;
        switch (option)
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
        int numberOfNodes = random.Next(minNumberOfNodes, maxNumberOfNodes);
        return numberOfNodes;
    }
}
