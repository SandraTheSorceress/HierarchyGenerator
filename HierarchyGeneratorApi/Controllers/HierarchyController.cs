using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace HierarchyGeneratorApi.Controllers;

public class HierarchyController : ControllerBase
{
    private readonly IHierarchyService _hierarchyService;

    public HierarchyController(IHierarchyService hierarchyService)
    {
        _hierarchyService = hierarchyService;
    }

    [HttpGet("/api/hierarchy")]
    public ActionResult<IEnumerable<Hierarchy>> GetHierarchies()
    {
        return _hierarchyService.GetHierarchies();
    }
   

}



