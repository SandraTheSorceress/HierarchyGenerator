using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using Serilog;
using System.Text;

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

    public bool IsHierarchyPresent(int hierarchyId)
    {
        bool isExisting = _hierarchyRepository.IsHierarchyPresent(hierarchyId);
        return isExisting;
    }
}
