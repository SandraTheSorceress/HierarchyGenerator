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
        sb.Append("NodeId, NodeLabel, ParentId, ContactId");
        sb.Append(Environment.NewLine);
        foreach (var l1 in hierarchy.L1s)
        {
            if(l1.Contacts.Any())
            {
                foreach (var contact in l1.Contacts)
                {
                    sb.Append($"{l1.Id}, {l1.Name},, {contact.Name}");
                    sb.Append(Environment.NewLine);
                }
            } else
            {
                sb.Append($"{l1.Id}, {l1.Name},,");
                sb.Append(Environment.NewLine);
            }

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
