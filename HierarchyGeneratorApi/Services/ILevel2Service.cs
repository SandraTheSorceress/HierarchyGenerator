using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel2Service
{
    List<L2> GenerateL2s(CreateHierarchyParameters parameters);
    string GetCSV(int L1NodeId, List<L2> l2s);
}
