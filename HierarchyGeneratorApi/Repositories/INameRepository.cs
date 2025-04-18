using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Repositories;

public interface INameRepository
{

    public List<string> GetStartingPhonemesForPlace(Theme theme);
    public List<string> GetMiddlePhonemesForPlace(Theme theme);
    public List<string> GetEndingPhonemesForPlace(Theme theme);
}
