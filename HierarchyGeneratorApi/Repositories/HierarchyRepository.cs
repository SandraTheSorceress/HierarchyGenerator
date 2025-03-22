using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Repositories;

public class HierarchyRepository : IHierarchyRepository
{
    private readonly AppDbContext _context;

    public HierarchyRepository(AppDbContext context)
    {
        _context = context;
    }

    public List<Hierarchy> GetHierarchies()
    {
        List<Hierarchy> hierarchies = _context.Hierarchies.ToList();
        return hierarchies;
    }
}
