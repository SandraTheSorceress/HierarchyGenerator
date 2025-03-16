var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/api/hierarchies", () =>
{
    List<Hierarchy> hierarchies = new List<Hierarchy>();
    Hierarchy h1 = new Hierarchy(1, "FirstHierarchy", 5, DateTime.Now,DateTime.Now);
    Hierarchy h2 = new Hierarchy(2, "SecondHierarchy", 7, DateTime.Now, DateTime.Now);
    Hierarchy h3 = new Hierarchy(3, "ThirdHierarchy", 9, DateTime.Now, DateTime.Now);
    Hierarchy h4 = new Hierarchy(4, "FourthHierarchy", 3, DateTime.Now, DateTime.Now);
    Hierarchy h5 = new Hierarchy(5, "FifthsHierarchy", 1, DateTime.Now, DateTime.Now);
    hierarchies.Add(h1);
    hierarchies.Add(h2);
    hierarchies.Add(h3);
    hierarchies.Add(h4);
    hierarchies.Add(h5);
    return hierarchies;
})
.WithName("GetWeatherForecast")
.WithOpenApi();

app.Run();

record Hierarchy(int Id, string Name, int NumberOfNodes, DateTime CreatedDate, DateTime LastModified)
{
    
}
