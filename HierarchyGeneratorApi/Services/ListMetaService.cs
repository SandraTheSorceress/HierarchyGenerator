using HierarchyGeneratorApi.DTOs;
using HierarchyGeneratorApi.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Serilog;
using System.Collections.Generic;

namespace HierarchyGeneratorApi.Services;

public class ListMetaService : IListMetaService
{
    public ListMetaDTO CreateMeta(List<Hierarchy> hierarchies, int page, int limit)
    {
        ListMetaDTO meta = new ListMetaDTO();
        meta.Total = hierarchies.Count;
        meta.Limit = limit;
        meta.Page = page;
        meta.TotalPages = (int)Math.Ceiling((double)meta.Total / meta.Limit);
        return meta;
    }

    public (int StartingIndex, int ItemsOnPage) CalculatePagination(int totalItems, int page, int limit)
    {
        int startingIndex = ((page - 1) * limit);

        int hierarchiesInPage = Math.Min(limit, totalItems - startingIndex);

        return (startingIndex, hierarchiesInPage);
    }

 
 

}
