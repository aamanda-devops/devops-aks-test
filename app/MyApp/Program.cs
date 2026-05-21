var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => Results.Ok(new
{
    status = "ok",
    service = "myapp",
    timestamp = DateTime.UtcNow
}));

app.Run();