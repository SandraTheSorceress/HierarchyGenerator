using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel3Service
{
    string GetCSV(int L1NodeId, List<L3> l3s);
}
