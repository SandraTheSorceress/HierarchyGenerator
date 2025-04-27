using HierarchyGeneratorApi.DTOs;

namespace HierarchyGeneratorApi.Services;

public interface IListMetaService
{
    ListMetaDTO CreateMeta(List<Models.Hierarchy> hierarchies, int page, int limit);

    (int StartingIndex, int ItemsOnPage) CalculatePagination(int totalItems, int page, int limit);
}
