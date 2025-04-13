using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L5Contact
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey("L5")]
    public int L5Id { get; set; }
    public L5 L5 { get; set; }
}
