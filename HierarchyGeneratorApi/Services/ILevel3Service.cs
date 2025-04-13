using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel3Service
{
    string GetCSV(int L2NodeId, List<L3> l3s);
}
