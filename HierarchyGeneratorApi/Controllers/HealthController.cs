using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace HierarchyGeneratorApi.Controllers;

public class HealthController : ControllerBase
{
    private readonly IHierarchyService _hierarchyService;
    public HealthController(IHierarchyService hierarchyService)
    {
        _hierarchyService = hierarchyService;
    }

    [HttpGet("/healthz")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Hierarchy> hierarchies = _hierarchyService.GetHierarchies();
            return Ok("OK");
        } catch (MySqlConnector.MySqlException)
        {
            return StatusCode(503, "Database is not ready or not working");
        } catch {
            return StatusCode(503, "API is not ready or not healthy");
        }
    }
}
