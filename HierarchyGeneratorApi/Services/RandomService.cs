using Microsoft.Extensions.AI;

namespace HierarchyGeneratorApi.Services;

public class RandomService : IRandomService
{
    private readonly IChatClient _chatClient;

    public RandomService(IChatClient chatClient)
    {
        _chatClient = chatClient;
    }

    public string GetRandomName()
    {
        var prompt = "Respond with one words: a fictional Swedish first name. No descriptions, no extra text, no punctuation.";
        var response = _chatClient
            .GetResponseAsync(prompt, cancellationToken: default)
            .ConfigureAwait(false)
            .GetAwaiter()
            .GetResult();

        return response.Text;
    }
}
