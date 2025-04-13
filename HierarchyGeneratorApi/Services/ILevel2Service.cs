using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel2Service
{
    string GetCSV(int L1NodeId, List<L2> l2s);
}
