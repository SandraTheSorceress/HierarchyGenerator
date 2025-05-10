namespace HierarchyGeneratorApi.DTOs;

public class HierarchyDTO
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string CreatedByName { get; set; }
    public string CreatedByEmail { get; set; }
    public int? NumberOfNodes { get; set; }
    public int? NumberOfContacts { get; set; }
    public DateTime CreatedDate { get; set; }
    public DateTime LastModified { get; set; }
}

