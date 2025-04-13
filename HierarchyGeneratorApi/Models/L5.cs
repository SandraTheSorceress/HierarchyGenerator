using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L5
{
    public int Id { get; set; }
    public int NodeId { get; set; }
    public string Name { get; set; }

    [ForeignKey("L4")]
    public int L4Id { get; set; }
    public L4 L4 { get; set; }

    public List<L5Contact> Contacts { get; set; } = new List<L5Contact>();
}
