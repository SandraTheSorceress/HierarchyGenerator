using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Repositories;

public interface INameRepository
{

    public List<string> GetStartingPhonemesForPlace(Theme theme);
    public List<string> GetMiddlePhonemesForPlace(Theme theme);
    public List<string> GetEndingPhonemesForPlace(Theme theme);
    public List<string> GetAdjectivesForL1Place(Theme theme);
    public List<string> GetAdjectivesForL2Place(Theme theme);
    public List<string> GetAdjectivesForL3Place(Theme theme);
    public List<string> GetAdjectivesForL4Place(Theme theme);
    public List<string> GetAdjectivesForL5Place(Theme theme);

    public List<string> GetTitlesForL1Place(Theme theme);
    public List<string> GetTitlesForL2Place(Theme theme);
    public List<string> GetTitlesForL3Place(Theme theme);
    public List<string> GetTitlesForL4Place(Theme theme);
    public List<string> GetTitlesForL5Place(Theme theme);

}
