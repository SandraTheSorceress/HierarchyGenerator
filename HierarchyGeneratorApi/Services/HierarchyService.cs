using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using Serilog;
using System.Text;

namespace HierarchyGeneratorApi.Services;

public class HierarchyService : IHierarchyService
{
    private readonly IHierarchyRepository _hierarchyRepository;

    public HierarchyService(IHierarchyRepository hierarchyRepository)
    {
        _hierarchyRepository = hierarchyRepository;
    }

    public string? GetCSV(int hierarchyId)
    {
        Hierarchy? hierarchy = _hierarchyRepository.GetHierarchyById(hierarchyId);
        if (hierarchy == null)
        {
            return null;
        }

        StringBuilder sb = new StringBuilder();
        sb.Append("NodeId, NodeLabel, ParentId");
        sb.Append(Environment.NewLine);
        foreach (var l1 in hierarchy.L1s)
        {
            sb.Append($"{l1.Id}, {l1.Name}, {l1.Hierarchy.Id}");
            sb.Append(Environment.NewLine);
        }

        return sb.ToString();
    }

    public List<Hierarchy> GetHierarchies()
    {
        List<Hierarchy> hierarchies = _hierarchyRepository.GetHierarchies();
        Log.Information("{Count} hierarchies have been fetched from the database", hierarchies.Count);
        return hierarchies;
    }
}
