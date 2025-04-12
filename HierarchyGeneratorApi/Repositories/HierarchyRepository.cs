using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.Models;
using Microsoft.EntityFrameworkCore;

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

    public Hierarchy? GetHierarchyById(int id)
    {
        return _context.Hierarchies
            .Include(h => h.L1s)
            .ThenInclude(l1 => l1.Contacts)
            .FirstOrDefault(h => h.Id == id);
    }
}
