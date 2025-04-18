using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Repositories;

public class NameRepository : INameRepository
{
    private readonly AppDbContext _context;

    public NameRepository(AppDbContext context)
    {
        _context = context;
    }
    public List<string> GetAdjectivesForL1Place(Theme theme) => GetAdjectivesForPlace(theme, "L1");
    public List<string> GetAdjectivesForL2Place(Theme theme) => GetAdjectivesForPlace(theme, "L2");
    public List<string> GetAdjectivesForL3Place(Theme theme) => GetAdjectivesForPlace(theme, "L3");
    public List<string> GetAdjectivesForL4Place(Theme theme) => GetAdjectivesForPlace(theme, "L4");
    public List<string> GetAdjectivesForL5Place(Theme theme) => GetAdjectivesForPlace(theme, "L5");

    public List<string> GetTitlesForL1Place(Theme theme) => GetTitlesForPlace(theme, "L1");
    public List<string> GetTitlesForL2Place(Theme theme) => GetTitlesForPlace(theme, "L2");
    public List<string> GetTitlesForL3Place(Theme theme) => GetTitlesForPlace(theme, "L3");
    public List<string> GetTitlesForL4Place(Theme theme) => GetTitlesForPlace(theme, "L4");
    public List<string> GetTitlesForL5Place(Theme theme) => GetTitlesForPlace(theme, "L5");

    public List<string> GetStartingPhonemesForPlace(Theme theme) => GetPhonemesForPlace(theme, "STARTING");
    public List<string> GetMiddlePhonemesForPlace(Theme theme) => GetPhonemesForPlace(theme, "MIDDLE");
    public List<string> GetEndingPhonemesForPlace(Theme theme) => GetPhonemesForPlace(theme, "ENDING");
    

    private List<string> GetPhonemesForPlace(Theme theme, string position)
    {
        List<string> phonemes = _context.NamePhonemes
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.Position == position)
                .Select(np => np.Value)
                .ToList();

        return phonemes;
    }

    private List<string> GetAdjectivesForPlace(Theme theme, string nodeLevel)
    {
        List<string> adjectives = _context.NameAdjectives
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.NodeLevel == nodeLevel)
                .Select(np => np.Value)
                .ToList();

        return adjectives;
    }

    private List<string> GetTitlesForPlace(Theme theme, string nodeLevel)
    {
        return _context.NameTitles
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.NodeLevel == nodeLevel)
            .Select(np => np.Value)
            .ToList();
    }

} 
