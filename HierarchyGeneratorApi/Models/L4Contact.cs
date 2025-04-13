using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L4Contact
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey("L4")]
    public int L4Id { get; set; }
    public L4 L4 { get; set; }
}
