using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface IHierarchyService
{
    string? GetCSV(int hierarchyId);
    List<Hierarchy> GetHierarchies();
}
