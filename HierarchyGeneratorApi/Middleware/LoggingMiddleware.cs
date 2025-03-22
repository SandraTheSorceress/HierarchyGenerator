namespace HierarchyGeneratorApi.Middleware;

using Serilog;

public class LoggingMiddleware
{
    private readonly RequestDelegate _next;

    public LoggingMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        Log.Information($"HTTP Endpoint: {context.Request.Method} {context.Request.Path}");
        await _next(context);
        Log.Information($"HTTP Status Code: {context.Response.StatusCode}");
    }
}
