using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L2Contact
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey("L2")]
    public int L2Id { get; set; }
    public L2 L2 { get; set; }
}
