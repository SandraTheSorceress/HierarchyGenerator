using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using Serilog;

namespace HierarchyGeneratorApi.Services;

public class HierarchyService : IHierarchyService
{
    private readonly IHierarchyRepository _hierarchyRepository;

    public HierarchyService(IHierarchyRepository hierarchyRepository)
    {
        _hierarchyRepository = hierarchyRepository;
    }
    public List<Hierarchy> GetHierarchies()
    {
        List<Hierarchy> hierarchies = _hierarchyRepository.GetHierarchies();
        Log.Information("{Count} hierarchies have been fetched from the database", hierarchies.Count);
        return hierarchies;
    }
}
