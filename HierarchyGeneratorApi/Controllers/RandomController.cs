using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace HierarchyGeneratorApi.Controllers;

public class RandomController : ControllerBase
{
    private readonly IRandomService _randomService;

    public RandomController(IRandomService randomService)
    {
        _randomService = randomService;
    }

    [HttpGet("/api/random/name")]
    public ActionResult<string> GetHierarchies()
    {
        return _randomService.GetRandomName();
    }

}



