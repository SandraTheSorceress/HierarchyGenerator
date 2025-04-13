using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L1Contact
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey("L1")]
    public int L1Id { get; set; }
    public L1 L1 { get; set; }
}
