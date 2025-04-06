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
    public ActionResult<ListResponseDTO> GetHierarchies()
    {
        ListResponseDTO responseDTO = new ListResponseDTO();
        
        List<Hierarchy> hierarchies = _hierarchyService.GetHierarchies();
        foreach (var hierarchy in hierarchies)
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


        return responseDTO;
    }
   

}



