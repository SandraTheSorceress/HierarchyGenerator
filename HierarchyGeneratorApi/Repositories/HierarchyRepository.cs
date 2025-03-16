using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Repositories;

public class HierarchyRepository : IHierarchyRepository
{
    public List<Hierarchy> GetHierarchies()
    {
        List<Hierarchy> hierarchies = new List<Hierarchy>();
        Hierarchy h1 = new Hierarchy() { Id = 1, Name = "First Hierarchy", NumberOfNodes = 1, CreatedDate = DateTime.Now, LastModified = DateTime.Now };
        Hierarchy h2 = new Hierarchy() { Id = 2, Name = "Second Hierarchy", NumberOfNodes = 1, CreatedDate = DateTime.Now, LastModified = DateTime.Now };
        Hierarchy h3 = new Hierarchy() { Id = 3, Name = "Third Hierarchy", NumberOfNodes = 1, CreatedDate = DateTime.Now, LastModified = DateTime.Now };
        hierarchies.Add(h1);
        hierarchies.Add(h2);
        hierarchies.Add(h3);
        return hierarchies;
    }
}
