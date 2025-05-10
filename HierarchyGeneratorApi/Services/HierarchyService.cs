using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using Serilog;

namespace HierarchyGeneratorApi.Services;

public class HierarchyService : IHierarchyService
{
    private readonly IHierarchyRepository _hierarchyRepository;
    private readonly ILevel1Service _level1Service;

    public HierarchyService(IHierarchyRepository hierarchyRepository, ILevel1Service level1Service)
    {
        _hierarchyRepository = hierarchyRepository;
        _level1Service = level1Service;
    }

    public int CountNodes(int hierarchyId)
    {
        int hierarchyCount = 0;
        Hierarchy? hierarchy = _hierarchyRepository.GetHierarchyById(hierarchyId);
        if (hierarchy == null)
        {
            return hierarchyCount;
        }
        foreach (var l1 in hierarchy.L1s) {
            hierarchyCount++;
            foreach (var l2 in l1.L2s)
            {
                hierarchyCount++;
                foreach (var l3 in l2.L3s)
                {
                    hierarchyCount++;
                    foreach (var l4 in l3.L4s)
                    {
                        hierarchyCount++;
                        foreach (var l5 in l4.L5s)
                        {
                            hierarchyCount++;
                        }
                    }
                }
            }
        }
        return hierarchyCount;
    }

    public void CreateHierarchy(string userFullName, string userEmail, CreateHierarchyParameters parameters)
    {
        Hierarchy hierarchy = new Hierarchy() {
            Name = parameters.Name,
            CreatedByName = userFullName,
            CreatedByEmail = userEmail,
            CreatedDate = DateTime.Now,
            LastModified = DateTime.Now,
        };
        List<L1> L1s = _level1Service.GenerateL1s(parameters);
        hierarchy.L1s = L1s;
        _hierarchyRepository.SaveHierarchy(hierarchy);
    }

    public void DeleteHierarchy(int hierarchyId)
    {
        _hierarchyRepository.DeleteHierarchy(hierarchyId);
    }

    public string? GetCSV(int hierarchyId)
    {
        Hierarchy? hierarchy = _hierarchyRepository.GetHierarchyById(hierarchyId);
        if (hierarchy == null)
        {
            return null;
        }

        string csv = _level1Service.GetCSV(hierarchy.L1s);

        return csv;
    }

    public List<Hierarchy> GetHierarchies()
    {
        List<Hierarchy> hierarchies = _hierarchyRepository.GetHierarchies();
        Log.Information("{Count} hierarchies have been fetched from the database", hierarchies.Count);
        return hierarchies;
    }

    public bool IsHierarchyCreatedByUser(string userEmail, int hierarchyId)
    {
        Hierarchy? hierarchy = _hierarchyRepository.GetHierarchyById(hierarchyId);
        if (hierarchy == null)
        {
            return false;
        }
        bool createdByUser = hierarchy.CreatedByEmail == userEmail;
        return createdByUser;
    }

    public bool IsHierarchyPresent(int hierarchyId)
    {
        bool isExisting = _hierarchyRepository.IsHierarchyPresent(hierarchyId);
        return isExisting;
    }

    public void UpdateHierarchyName(int hierarchyId, string newName)
    {
        _hierarchyRepository.UpdateHierarchyName(hierarchyId, newName);
    }
}
