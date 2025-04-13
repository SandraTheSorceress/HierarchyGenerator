using System.ComponentModel.DataAnnotations.Schema;

namespace HierarchyGeneratorApi.Models;

public class L2
{
    public int Id { get; set; }
    public int NodeId { get; set; }
    public string Name { get; set; }

    [ForeignKey("L1")]
    public int L1Id { get; set; }
    public L1 L1 { get; set; }

    public List<L2Contact> Contacts { get; set; } = new List<L2Contact>();
    public List<L3> L3s { get; set; } = new List<L3>();
}
