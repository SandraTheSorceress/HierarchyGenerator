using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface IHierarchyService
{
    int CountNodes(int hierarchyId);
    void CreateHierarchy(string userFullName, string userEmail, CreateHierarchyParameters parameters);
    void DeleteHierarchy(int hierarchyId);
    string? GetCSV(int hierarchyId);
    List<Hierarchy> GetHierarchies();
    bool IsHierarchyCreatedByUser(string userEmail, int hierarchyId);
    bool IsHierarchyPresent(int hierarchyId);
    void UpdateHierarchyName(int hierarchyId, string newName);
}
