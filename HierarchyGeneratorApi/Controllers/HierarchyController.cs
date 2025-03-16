using Microsoft.AspNetCore.Mvc;

namespace HierarchyGeneratorApi.Controllers;

public class HierarchyController : ControllerBase
{
    [HttpGet("/api/hierarchy")]
    public ActionResult<IEnumerable<Hierarchy>> GetHierarchies()
    {
        List<Hierarchy> hierarchies = new List<Hierarchy>();
        Hierarchy h1 = new Hierarchy(1, "First Hierarchy", 5, DateTime.Now, DateTime.Now);
        Hierarchy h2 = new Hierarchy(2, "Second Hierarchy", 7, DateTime.Now, DateTime.Now);
        Hierarchy h3 = new Hierarchy(3, "Third Hierarchy", 9, DateTime.Now, DateTime.Now);
        Hierarchy h4 = new Hierarchy(4, "Fourth Hierarchy", 3, DateTime.Now, DateTime.Now);
        Hierarchy h5 = new Hierarchy(5, "Fifths Hierarchy", 1, DateTime.Now, DateTime.Now);
        hierarchies.Add(h1);
        hierarchies.Add(h2);
        hierarchies.Add(h3);
        hierarchies.Add(h4);
        hierarchies.Add(h5);
        return hierarchies;
    }
    public record Hierarchy(int Id, string Name, int NumberOfNodes, DateTime CreatedDate, DateTime LastModified)
    {

    }

}



