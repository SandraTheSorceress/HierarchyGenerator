using HierarchyGeneratorApi.DTOs;
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
    public ActionResult<ListResponseDTO> GetHierarchies(int page = 1, int limit = 5)
    {

        ListResponseDTO responseDTO = new ListResponseDTO();
        
        List<Hierarchy> hierarchies = _hierarchyService.GetHierarchies();

        ListMetaDTO meta = new ListMetaDTO();
        meta.Total = hierarchies.Count;
        meta.Limit = limit;
        meta.Page = page;
        meta.TotalPages = meta.Total / meta.Limit;
        if(meta.Page < 1 || meta.Page > meta.TotalPages)
        {
            return BadRequest(new { message = "Page does not exist." });
        }

        int startingIndex = 0 + (((page - 1) * limit));
        List<Hierarchy> hierarchiesInCurrentPage = hierarchies.GetRange(startingIndex, limit);
        foreach (var hierarchy in hierarchiesInCurrentPage)
        {
            HierarchyDTO hierarchyDTO = new HierarchyDTO()
            {
                Id = hierarchy.Id,
                Name = hierarchy.Name,
                NumberOfNodes = hierarchy.NumberOfNodes,
                NumberOfEndUsers = hierarchy.NumberOfEndUsers,
                NumberOfAttributes = hierarchy.NumberOfAttributes,
                NumberOfContacts = hierarchy.NumberOfContacts,
                CreatedDate = hierarchy.CreatedDate,
                LastModified = hierarchy.LastModified,
                Status = hierarchy.Status,
            };
            responseDTO.data.Add(hierarchyDTO);
        }
        responseDTO.meta = meta;

        return responseDTO;
    }
   

}



