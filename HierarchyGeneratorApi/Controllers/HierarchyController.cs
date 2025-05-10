using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System.Security.Claims;

namespace HierarchyGeneratorApi.Controllers;

public class HierarchyController : ControllerBase
{
    private readonly IHierarchyService _hierarchyService;
    private readonly IListMetaService _listMetaService;

    public HierarchyController(IHierarchyService hierarchyService, IListMetaService listMetaService)
    {
        _hierarchyService = hierarchyService;
        _listMetaService = listMetaService;
    }

    [HttpGet("/api/hierarchy")]
    public ActionResult<ListResponseDTO> GetHierarchies(string? search, int page = 1, int limit = 5)
    {
        
        ListResponseDTO responseDTO = new ListResponseDTO();
        
        List<Hierarchy> hierarchies = _hierarchyService.GetHierarchies().OrderByDescending(h => h.LastModified).ToList();

        if (!string.IsNullOrEmpty(search))
        {
            hierarchies = hierarchies.FindAll(h => h.Name.ToLower().Contains(search.ToLower()));
        }

        ListMetaDTO meta = _listMetaService.CreateMeta(hierarchies, page, limit);
        if (meta.Page < 1 || meta.Page > meta.TotalPages)
        {
            return BadRequest(new { message = "Page does not exist." });
        }

        var (startingIndex, hierarchiesInPage) = _listMetaService.CalculatePagination(hierarchies.Count, page, limit);
        List<Hierarchy> hierarchiesInCurrentPage = hierarchies.GetRange(startingIndex, hierarchiesInPage);
        foreach (var hierarchy in hierarchiesInCurrentPage)
        {
            int numerOfNodes = _hierarchyService.CountNodes(hierarchy.Id);
            HierarchyDTO hierarchyDTO = new HierarchyDTO()
            {
                Id = hierarchy.Id,
                Name = hierarchy.Name,
                NumberOfNodes = numerOfNodes,
                CreatedDate = hierarchy.CreatedDate,
                LastModified = hierarchy.LastModified
            };
            responseDTO.data.Add(hierarchyDTO);
        }
        responseDTO.meta = meta;

        return responseDTO;
    }

    [HttpGet("/api/hierarchy/{id}/download")]
    public ActionResult<string> DownloadHierarchy(int id)
    {

        string? csv = _hierarchyService.GetCSV(id);
        if(csv == null)
        {
            return NotFound(new { message = "Hierarchy does not exist." });
        }
        byte[] fileBytes = System.Text.Encoding.UTF8.GetBytes(csv);

        return File(fileBytes, "text/csv", $"hierarchy_{id}.csv");
    }

    [Authorize]
    [HttpDelete("/api/hierarchy/{id}")]
    public ActionResult<string> DeleteHierarchy(int id)
    {
        Boolean isExisting = _hierarchyService.IsHierarchyPresent(id);
        if (isExisting)
        {
            _hierarchyService.DeleteHierarchy(id);
            return NoContent();
        } else
        {
            return NotFound(new { message = "Hierarchy does not exist." });
        }
        
    }

    [Authorize]
    [HttpPost("/api/hierarchy")]
    public ActionResult CreateHierchy([FromBody] CreateHierarchyParameters parameters)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest("Bad request!");
        }

        var userEmail = User?.FindFirst(ClaimTypes.Email)?.Value;
        var userFullName = User?.FindFirst(ClaimTypes.Name)?.Value;

        if (string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(userFullName))
        {
            return Unauthorized("User name and email is missing inside OpenId JWT.");
        } else
        {
            Log.Information("User Email: {userEmail}", userEmail);
            Log.Information("User Full Name: {userEmail}", userFullName);
        }


        _hierarchyService.CreateHierarchy(parameters);
        return Created();
    }

    [Authorize]
    [HttpPut("/api/hierarchy/{id}")]
    public ActionResult UpdateHierarchyName(int id, [FromBody] UpdateHierarchyNameDTO updateRequest)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest("Bad request!");
        }

        bool isExisting = _hierarchyService.IsHierarchyPresent(id);
        if (isExisting)
        {
            _hierarchyService.UpdateHierarchyName(id, updateRequest.NewName);
            return Ok(new { message = "Hierarchy name updated successfully." });
        } else
        {
            return NotFound(new { message = "Hierarchy does not exist." });
        }
    }

}



