using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace HierarchyGeneratorApi.DTOs;

public class CreateHierarchyParameters
{
    [Required(ErrorMessage = "Name is required.")]
    [MinLength(1, ErrorMessage = "Name cannot be empty.")]
    [MaxLength(30, ErrorMessage = "Name cannot be longer than 30 charachters.")]
    public string Name { get; set; }

    [JsonConverter(typeof(JsonStringEnumConverter))]
    public Theme Theme { get; set; }

    [JsonConverter(typeof(JsonStringEnumConverter))]
    public L1Option L1 { get; set; }

    [JsonConverter(typeof(JsonStringEnumConverter))]
    public L2ToL4Option L2 { get; set; }

    [JsonConverter(typeof(JsonStringEnumConverter))]
    public L2ToL4Option L3 { get; set; }

    [JsonConverter(typeof(JsonStringEnumConverter))]
    public L2ToL4Option L4 { get; set; }

    [JsonConverter(typeof(JsonStringEnumConverter))]
    public L5Option L5 { get; set; }
}

public enum Theme
{
    FANTASY,
    SPACE,
    VIKING
}

public enum L1Option
{
    A_FEW,
    SOME,
    SURPRISE_ME
}

public enum L2ToL4Option
{
    NONE,
    A_FEW,
    SOME,
    SURPRISE_ME
}

public enum L5Option
{
    NONE,
    A_FEW,
    SOME,
    A_LOT,
    TONS,
    SURPRISE_ME
}