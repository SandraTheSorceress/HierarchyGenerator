using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel5Service
{
    List<L5> GenerateL5s(CreateHierarchyParameters parameters);
    string GetCSV(int L4NodeId, List<L5> l5s);
}
