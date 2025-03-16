using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;

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
        return _hierarchyRepository.GetHierarchies();
    }
}
