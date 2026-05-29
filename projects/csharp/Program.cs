using ExampleApp;

var app = new SampleApp();

Console.WriteLine(app.BuildGreeting("C#"));
Console.WriteLine();
Console.WriteLine("Today's tasks:");

foreach (var task in app.GetSeedTasks())
{
    Console.WriteLine(task);
}
