using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel5Service
{
    string GetCSV(int L4NodeId, List<L5> l5s);
}
