using System;

enum Status { Todo, Doing, Done }

record Task(string Title, Status Status);

Console.WriteLine(new Task("Add C# fixture", Status.Doing));
