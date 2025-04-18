using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Repositories;

public class NameRepository : INameRepository
{
    private readonly AppDbContext _context;

    public NameRepository(AppDbContext context)
    {
        _context = context;
    }

    public List<string> GetAdjectivesForL1Place(Theme theme)
    {
        List<string> adjectives = _context.NameAdjectives
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.NodeLevel == "L1")
                .Select(np => np.Value)
                .ToList();

        return adjectives;
    }

    public List<string> GetTitlesForL1Place(Theme theme)
    {
        List<string> titles = _context.NameTitles
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.NodeLevel == "L1")
                .Select(np => np.Value)
                .ToList();

        return titles;
    }

    public List<string> GetEndingPhonemesForPlace(Theme theme)
    {
        List<string> phonemes = _context.NamePhonemes
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.Position == "ENDING")
                .Select(np => np.Value)
                .ToList();

        return phonemes;
    }

    public List<string> GetMiddlePhonemesForPlace(Theme theme)
    {
        List<string> phonemes = _context.NamePhonemes
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.Position == "MIDDLE")
                .Select(np => np.Value)
                .ToList();

        return phonemes;
    }

    public List<string> GetStartingPhonemesForPlace(Theme theme)
    {
        List<string> phonemes = _context.NamePhonemes
            .Where(np => np.Theme == theme.ToString()
                && np.Category == "PLACE"
                && np.Position == "STARTING")
                .Select(np => np.Value)
                .ToList();

        return phonemes;
    }
} 
