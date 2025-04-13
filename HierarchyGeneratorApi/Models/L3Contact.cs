using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L3Contact
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey("L3")]
    public int L3Id { get; set; }
    public L3 L3 { get; set; }
}
