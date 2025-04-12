using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace HierarchyGeneratorApi.Models;

public class L1
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey("Hierarchy")]
    public int HierarchyId { get; set; }
    public Hierarchy Hierarchy { get; set; }
}
