using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L3
{
    public int Id { get; set; }
    public int NodeId { get; set; }
    public string Name { get; set; }

    [ForeignKey("L2")]
    public int L2Id { get; set; }
    public L2 L2 { get; set; }

    public List<L3Contact> Contacts { get; set; } = new List<L3Contact>();
    public List<L4> L4s { get; set; } = new List<L4>();
}
