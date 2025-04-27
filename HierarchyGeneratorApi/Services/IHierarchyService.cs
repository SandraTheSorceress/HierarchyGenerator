using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface IHierarchyService
{
    int CountNodes(int hierarchyId);
    void CreateHierarchy(CreateHierarchyParameters parameters);
    void DeleteHierarchy(int hierarchyId);
    string? GetCSV(int hierarchyId);
    List<Hierarchy> GetHierarchies();
    bool IsHierarchyPresent(int hierarchyId);
}
