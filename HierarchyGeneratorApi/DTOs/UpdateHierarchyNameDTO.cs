using System.ComponentModel.DataAnnotations;

namespace HierarchyGeneratorApi.DTOs;

public class UpdateHierarchyNameDTO
{
    [Required(ErrorMessage = "Name is required.")]
    [MinLength(1, ErrorMessage = "Name cannot be empty.")]
    [MaxLength(30, ErrorMessage = "Name cannot be longer than 30 charachters.")]
    public string NewName { get; set; }
}
