using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.Middleware;
using HierarchyGeneratorApi.Repositories;
using HierarchyGeneratorApi.Services;
using Microsoft.EntityFrameworkCore;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateLogger();

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IHierarchyService, HierarchyService>();
builder.Services.AddScoped<IRandomService, RandomService>();
builder.Services.AddScoped<IHierarchyRepository, HierarchyRepository>();
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(builder.Configuration.GetConnectionString("DefaultConnection"),
        ServerVersion.AutoDetect(builder.Configuration.GetConnectionString("DefaultConnection"))));

if (builder.Environment.IsProduction())
{
    builder.WebHost.ConfigureKestrel(options =>
    {
        options.ListenAnyIP(80);
    });
}

var app = builder.Build();


app.UseSwagger();
app.UseSwaggerUI();
app.UseMiddleware<LoggingMiddleware>();

app.MapControllers();
app.Run();


