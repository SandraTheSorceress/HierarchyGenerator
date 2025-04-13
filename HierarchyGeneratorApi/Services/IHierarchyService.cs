using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface IHierarchyService
{
    void DeleteHierarchy(int hierarchyId);
    string? GetCSV(int hierarchyId);
    List<Hierarchy> GetHierarchies();
    bool IsHierarchyPresent(int hierarchyId);
}
