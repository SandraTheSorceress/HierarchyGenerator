using HierarchyGeneratorApi.Data;
using HierarchyGeneratorApi.Middleware;
using HierarchyGeneratorApi.Repositories;
using HierarchyGeneratorApi.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using Serilog;
using System.Text.Json.Serialization;


Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateLogger();

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
.AddJwtBearer(jwtOptions =>
{
    jwtOptions.Authority = "https://accounts.google.com";
    jwtOptions.Audience = "124048570352-kc8tmq3fm46tsu0meti06ivgp7p42f58.apps.googleusercontent.com";
    jwtOptions.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = false,
        ValidIssuer = "https://accounts.google.com",
        ValidAudience = "124048570352-kc8tmq3fm46tsu0meti06ivgp7p42f58.apps.googleusercontent.com"
    };
});
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter(null, allowIntegerValues: false));
});
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Hierarchy API", Version = "v1" });

    // Add Bearer Token support to Swagger UI
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        Description = "Enter your JWT token"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] { }
        }
    });
});
builder.Services.AddScoped<IHierarchyService, HierarchyService>();
builder.Services.AddScoped<ILevel1Service, Level1Service>();
builder.Services.AddScoped<ILevel2Service, Level2Service>();
builder.Services.AddScoped<ILevel3Service, Level3Service>();
builder.Services.AddScoped<ILevel4Service, Level4Service>();
builder.Services.AddScoped<ILevel5Service, Level5Service>();
builder.Services.AddScoped<INameService, NameService>();
builder.Services.AddScoped<INodeCountService, NodeCountService>();
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


