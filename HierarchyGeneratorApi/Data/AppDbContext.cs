using HierarchyGeneratorApi.Models;
using Microsoft.EntityFrameworkCore;

namespace HierarchyGeneratorApi.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions options) : base(options) { }

    public DbSet<Hierarchy> Hierarchies { get; set; }
    public DbSet<NamePhoneme> NamePhonemes { get; set; }
    public DbSet<NameAdjective> NameAdjectives { get; set; }
    public DbSet<NameTitle> NameTitles { get; set; }
}