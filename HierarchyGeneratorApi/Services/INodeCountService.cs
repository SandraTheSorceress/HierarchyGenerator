using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Services;

public interface INodeCountService
{
    public int GetNextNodeId();
    public int GetNumberOfNodes(L1Option option);
    public int GetNumberOfNodes(L2ToL4Option option);
}
