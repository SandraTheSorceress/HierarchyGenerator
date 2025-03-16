using HierarchyGeneratorApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace HierarchyGeneratorApi.Controllers;

public class HierarchyController : ControllerBase
{
    [HttpGet("/api/hierarchy")]
    public ActionResult<IEnumerable<Hierarchy>> GetHierarchies()
    {
        List<Hierarchy> hierarchies = new List<Hierarchy>();
        Hierarchy h1 = new Hierarchy() { Id=1, Name="First Hierarchy", NumberOfNodes=5, CreatedDate=DateTime.Now, LastModified=DateTime.Now };
        Hierarchy h2 = new Hierarchy() { Id = 2, Name = "Second Hierarchy", NumberOfNodes = 7, CreatedDate = DateTime.Now, LastModified = DateTime.Now };
        Hierarchy h3 = new Hierarchy() { Id = 3, Name = "Third Hierarchy", NumberOfNodes = 9, CreatedDate = DateTime.Now, LastModified = DateTime.Now };
        hierarchies.Add(h1);
        hierarchies.Add(h2);
        hierarchies.Add(h3);
        return hierarchies;
    }
   

}



