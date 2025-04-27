using System.ComponentModel.DataAnnotations;

namespace HierarchyGeneratorApi.DTOs;

public class UpdateHierarchyNameDTO
{
    [Required(ErrorMessage = "Name is required.")]
    [MinLength(1, ErrorMessage = "Name cannot be empty.")]
    [MaxLength(200, ErrorMessage = "Name cannot be longer than 200.")]
    public string NewName { get; set; }
}
