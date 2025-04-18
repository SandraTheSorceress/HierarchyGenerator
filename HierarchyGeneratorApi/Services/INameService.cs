using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Services;

public interface INameService
{
    public List<string> GenerateL1PlaceNames(Theme theme, int numberOfNames);
    public List<string> GenerateL2PlaceNames(Theme theme, int numberOfNames);
    public List<string> GenerateL3PlaceNames(Theme theme, int numberOfNames);
    public List<string> GenerateL4PlaceNames(Theme theme, int numberOfNames);
    public List<string> GenerateL5PlaceNames(Theme theme, int numberOfNames);
}
