namespace ExampleApp;

public sealed class SampleApp
{
    public string BuildGreeting(string platform)
    {
        return $"Hello from {platform}.";
    }

    public IReadOnlyList<string> GetSeedTasks()
    {
        return
        [
            "[x] Print a greeting",
            "[x] Load sample tasks",
            "[ ] Review generated output",
        ];
    }
}
