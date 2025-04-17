using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Repositories;

public interface IHierarchyRepository
{
    void DeleteHierarchy(int hierarchyId);
    List<Hierarchy> GetHierarchies();
    Hierarchy? GetHierarchyById(int hierarchyId);
    bool IsHierarchyPresent(int hierarchyId);
    void SaveHierarchy(Hierarchy hierarchy);
}
