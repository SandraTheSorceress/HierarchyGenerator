namespace HierarchyGeneratorApi.DTOs;

public class ListResponseDTO
{
    public List<HierarchyDTO> data { get; set; } = new List<HierarchyDTO>();
    public ListMetaDTO meta { get; set; }
}