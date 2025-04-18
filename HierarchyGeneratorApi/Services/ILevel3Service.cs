using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel3Service
{
    List<L3> GenerateL3s(CreateHierarchyParameters parameters);
    string GetCSV(int L2NodeId, List<L3> l3s);
}
