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

    public List<string> GenerateL2PlaceNames(Theme theme, int numberOfNames)
    {
        List<string> placeNames = GeneratePlaceNames(theme, numberOfNames);

        List<string> placeNamesWithTitles = DecorateWithL2Title(theme, placeNames);

        List<string> placeNamesWithTitlesAndAdjectives = DecorateWithL2Adjective(theme, placeNamesWithTitles);

        return placeNamesWithTitlesAndAdjectives;
    }

    public List<string> GenerateL3PlaceNames(Theme theme, int numberOfNames)
    {
        List<string> placeNames = GeneratePlaceNames(theme, numberOfNames);

        List<string> placeNamesWithTitles = DecorateWithL3Title(theme, placeNames);

        List<string> placeNamesWithTitlesAndAdjectives = DecorateWithL3Adjective(theme, placeNamesWithTitles);

        return placeNamesWithTitlesAndAdjectives;
    }

    public List<string> GenerateL4PlaceNames(Theme theme, int numberOfNames)
    {
        List<string> placeNames = GeneratePlaceNames(theme, numberOfNames);

        List<string> placeNamesWithTitles = DecorateWithL4Title(theme, placeNames);

        List<string> placeNamesWithTitlesAndAdjectives = DecorateWithL4Adjective(theme, placeNamesWithTitles);

        return placeNamesWithTitlesAndAdjectives;
    }

    public List<string> GenerateL5PlaceNames(Theme theme, int numberOfNames)
    {
        HashSet<string> placeTitles = new HashSet<string>();
        List<string> adjecetives = _nameRepository.GetAdjectivesForL5Place(theme);
        List<string> titles = _nameRepository.GetTitlesForL5Place(theme);

        for (int i = 0; i < numberOfNames; i++)
        {
            string randomName;
            do
            {
                string adjecetive = adjecetives[random.Next(adjecetives.Count)];
                string title = titles[random.Next(titles.Count)];

                randomName = $"{adjecetive} {title}";
            } while (placeTitles.Contains(randomName));
            placeTitles.Add(randomName);

        }

        return placeTitles.ToList();
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
    private List<string> DecorateWithL2Adjective(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithAdjectives = new List<string>();
        List<string> adjectives = _nameRepository.GetAdjectivesForL2Place(theme);
        foreach (var placeName in placeNames)
        {
            string adjective = adjectives[random.Next(adjectives.Count)];
            placeNamesWithAdjectives.Add($"{adjective} {placeName}");
        }
        return placeNamesWithAdjectives;
    }

    private List<string> DecorateWithL3Adjective(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithAdjectives = new List<string>();
        List<string> adjectives = _nameRepository.GetAdjectivesForL3Place(theme);
        foreach (var placeName in placeNames)
        {
            string adjective = adjectives[random.Next(adjectives.Count)];
            placeNamesWithAdjectives.Add($"{adjective} {placeName}");
        }
        return placeNamesWithAdjectives;
    }

    private List<string> DecorateWithL4Adjective(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithAdjectives = new List<string>();
        List<string> adjectives = _nameRepository.GetAdjectivesForL4Place(theme);
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

    private List<string> DecorateWithL2Title(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithTitles = new List<string>();
        List<string> titles = _nameRepository.GetTitlesForL2Place(theme);
        foreach (var placeName in placeNames)
        {
            string title = titles[random.Next(titles.Count)];
            placeNamesWithTitles.Add($"{title} {placeName}");
        }
        return placeNamesWithTitles;
    }

    private List<string> DecorateWithL3Title(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithTitles = new List<string>();
        List<string> titles = _nameRepository.GetTitlesForL3Place(theme);
        foreach (var placeName in placeNames)
        {
            string title = titles[random.Next(titles.Count)];
            placeNamesWithTitles.Add($"{title} {placeName}");
        }
        return placeNamesWithTitles;
    }

    private List<string> DecorateWithL4Title(Theme theme, List<string> placeNames)
    {
        List<string> placeNamesWithTitles = new List<string>();
        List<string> titles = _nameRepository.GetTitlesForL4Place(theme);
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
