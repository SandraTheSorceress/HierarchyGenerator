using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.Middleware;
using HierarchyGeneratorApi.Repositories;
using HierarchyGeneratorApi.Services;
using Microsoft.EntityFrameworkCore;
using Serilog;
using System.Text.Json.Serialization;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateLogger();

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter(null, allowIntegerValues: false));
});
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IHierarchyService, HierarchyService>();
builder.Services.AddScoped<ILevel1Service, Level1Service>();
builder.Services.AddScoped<ILevel2Service, Level2Service>();
builder.Services.AddScoped<ILevel3Service, Level3Service>();
builder.Services.AddScoped<ILevel4Service, Level4Service>();
builder.Services.AddScoped<ILevel5Service, Level5Service>();
builder.Services.AddScoped<IHierarchyRepository, HierarchyRepository>();
builder.Services.AddScoped<INameRepository, NameRepository>();
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


