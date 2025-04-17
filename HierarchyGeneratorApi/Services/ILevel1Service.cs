using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel1Service
{
    List<L1> GenerateL1s(CreateHierarchyParameters parameters);
    string GetCSV(List<L1> l1s);
}
