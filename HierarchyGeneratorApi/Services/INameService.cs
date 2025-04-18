﻿using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Services;

public interface INameService
{
    public List<string> GenerateL1PlaceNames(Theme theme, int numberOfNames);
}
