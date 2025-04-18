using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Services;

public interface INodeCountService
{
    int GetNumberOfNodes(L1Option l1);
}
