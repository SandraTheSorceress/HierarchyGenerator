using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L4
{
    public int Id { get; set; }
    public int NodeId { get; set; }
    public string Name { get; set; }

    [ForeignKey("L3")]
    public int L3Id { get; set; }
    public L3 L3 { get; set; }

    public List<L4Contact> Contacts { get; set; } = new List<L4Contact>();
    public List<L5> L5s { get; set; } = new List<L5>();
}
