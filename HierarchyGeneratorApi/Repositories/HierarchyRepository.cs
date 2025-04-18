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

    public void DeleteHierarchy(int hierarchyId)
    {
        var hierarchy = _context.Hierarchies.Find(hierarchyId);
        if (hierarchy == null)
        {
            throw new InvalidOperationException($"Hierarchy {hierarchyId} does not exist.");
        }
        _context.Hierarchies.Remove(hierarchy);
        _context.SaveChanges();
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
            .Include(h => h.L1s)
                .ThenInclude(l1 => l1.L2s)
                    .ThenInclude(l2 => l2.Contacts)
            .Include(h => h.L1s)
                .ThenInclude(l1 => l1.L2s)
                    .ThenInclude(l2 => l2.L3s)
                        .ThenInclude(l3 => l3.Contacts)
            .Include(h => h.L1s)
                .ThenInclude(l1 => l1.L2s)
                    .ThenInclude(l2 => l2.L3s)
                        .ThenInclude(l3 => l3.L4s)
                            .ThenInclude(l4 => l4.Contacts)
            .Include(h => h.L1s)
                .ThenInclude(l1 => l1.L2s)
                    .ThenInclude(l2 => l2.L3s)
                        .ThenInclude(l3 => l3.L4s)
                            .ThenInclude(l4 => l4.L5s)
                                .ThenInclude(l5 => l5.Contacts)
            .FirstOrDefault(h => h.Id == id);
    }

    public bool IsHierarchyPresent(int hierarchyId)
    {
        return _context.Hierarchies.Any(h => h.Id == hierarchyId);
    }

    public void SaveHierarchy(Hierarchy hierarchy)
    {
        _context.Hierarchies.Add(hierarchy);
        _context.SaveChanges();
    }
}
