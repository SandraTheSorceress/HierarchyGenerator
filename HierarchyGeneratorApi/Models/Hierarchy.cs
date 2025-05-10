namespace HierarchyGeneratorApi.Models;

public class Hierarchy
{
    public int Id { get; set; }
    public string Name { get; set; }

    public string CreatedByName { get; set; }

    public string CreatedByEmail { get; set; }
    public DateTime CreatedDate { get; set; }
    public DateTime LastModified { get; set; }
    public List<L1> L1s { get; set; } = new List<L1>();
}


