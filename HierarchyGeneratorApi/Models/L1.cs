using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L1
{
    public int Id { get; set; }
    public int NodeId { get; set; }
    public string Name { get; set; }

    [ForeignKey("Hierarchy")]
    public int HierarchyId { get; set; }
    public Hierarchy Hierarchy { get; set; }

    public List<L1Contact> Contacts { get; set; } = new List<L1Contact>();
    public List<L2> L2s { get; set; } = new List<L2>();
}
