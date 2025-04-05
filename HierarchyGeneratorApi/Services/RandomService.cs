using HierarchyGeneratorApi.Models;
using HierarchyGeneratorApi.Repositories;
using Microsoft.Extensions.AI;
using Serilog;

namespace HierarchyGeneratorApi.Services;

public class RandomService : IRandomService
{

    
    public string GetRandomName()
    {
        IChatClient chatClient = new OllamaChatClient(new Uri("http://localhost:11434/"), "phi3:mini");
        var prompt = "Give me a fictional first and last name! Respond with only the full name, nothing else.";
        var response = chatClient.GetResponseAsync(prompt, cancellationToken: default).ConfigureAwait(false).GetAwaiter().GetResult();
        return response.Text;
    }
}
