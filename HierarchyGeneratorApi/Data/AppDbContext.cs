using HierarchyGeneratorApi.Models;
using Microsoft.EntityFrameworkCore;

namespace HierarchyGeneratorApi.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions options) : base(options) { }

    public DbSet<Hierarchy> Hierarchies { get; set; }
}
