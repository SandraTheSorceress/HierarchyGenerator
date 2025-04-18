using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Repositories;
using System;

namespace HierarchyGeneratorApi.Services;

public class NameService : INameService
{
    private readonly Random random = new Random();
    private readonly INameRepository _nameRepository;

    public NameService(INameRepository nameRepository)
    {
        _nameRepository = nameRepository;
    }

    public List<string> GenerateL1PlaceNames(Theme theme, int numberOfNames)
    {
        
        List<string> placeNames = GeneratePlaceNames(theme, numberOfNames);

        List<string> placeNamesWithTitles = DecorateWithL1Title(theme, placeNames);

        List<string> placeNamesWithTitlesAndAdjectives = DecorateWithL1Adjective(theme, placeNamesWithTitles);

        return placeNamesWithTitlesAndAdjectives;

    }

    private List<string> DecorateWithL1Adjective(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithAdjectives = new List<string>();
        List<string> adjectives = _nameRepository.GetAdjectivesForL1Place(theme);
        foreach (var placeName in placeNames)
        {
            string adjective = adjectives[random.Next(adjectives.Count)];
            placeNamesWithAdjectives.Add($"{adjective} {placeName}");
        }
        return placeNamesWithAdjectives;
    }

    private List<string> DecorateWithL1Title(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithTitles = new List<string>();
        List<string> titles = _nameRepository.GetTitlesForL1Place(theme);
        foreach (var placeName in placeNames)
        {
            string title = titles[random.Next(titles.Count)];
            placeNamesWithTitles.Add($"{title} {placeName}");
        }
        return placeNamesWithTitles;
    }

    private List<string> GeneratePlaceNames(Theme theme, int numberOfNames)
    {
        HashSet<string> placeNames = new HashSet<string>();
        List<string> startingPhonemes = _nameRepository.GetStartingPhonemesForPlace(theme);
        List<string> middlePhonemes = _nameRepository.GetMiddlePhonemesForPlace(theme);
        List<string> endingPhonemes = _nameRepository.GetEndingPhonemesForPlace(theme);

        for (int i = 0; i < numberOfNames; i++)
        {
            string randomName;
            do
            {
                string start = startingPhonemes[random.Next(startingPhonemes.Count)];
                string middle = middlePhonemes[random.Next(middlePhonemes.Count)];
                string end = endingPhonemes[random.Next(endingPhonemes.Count)];

                randomName = start + middle + end;
            } while (placeNames.Contains(randomName));
            placeNames.Add(randomName);

        }

        return placeNames.ToList();
    }
}
