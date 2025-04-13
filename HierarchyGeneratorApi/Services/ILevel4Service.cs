using HierarchyGeneratorApi.Models;

namespace HierarchyGeneratorApi.Services;

public interface ILevel4Service
{
    string GetCSV(int L3NodeId, List<L4> l4s);
}
