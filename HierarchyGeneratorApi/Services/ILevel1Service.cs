using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel1Service
{
    string GetCSV(List<L1> l1s);
}
