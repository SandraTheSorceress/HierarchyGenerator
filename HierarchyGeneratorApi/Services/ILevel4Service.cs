using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel4Service
{
    List<L4> GenerateL4s(CreateHierarchyParameters parameters);
    string GetCSV(int L3NodeId, List<L4> l4s);
}
