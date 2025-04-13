﻿using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Repositories;

public interface IHierarchyRepository
{
    List<Hierarchy> GetHierarchies();
    Hierarchy? GetHierarchyById(int hierarchyId);
}
