namespace BasicFiles

open System
open System.Text.RegularExpressions

[<RequireQualifiedAccess>]
type Status =
    | Todo
    | Doing
    | Done

type Task =
    { Id: Guid
      Title: string
      Status: Status
      Tags: string list }

module Tasks =
    let private statusPattern =
        Regex("^(?<status>todo|doing|done)$", RegexOptions.IgnoreCase)

    let parseStatus value =
        match statusPattern.Match(value) with
        | m when m.Success ->
            match m.Groups["status"].Value.ToLowerInvariant() with
            | "todo" -> Ok Status.Todo
            | "doing" -> Ok Status.Doing
            | "done" -> Ok Status.Done
            | other -> Error $"Unknown status: {other}"
        | _ -> Error $"Invalid status token: {value}"

    let summarize tasks =
        tasks
        |> Seq.groupBy _.Status
        |> Seq.map (fun (status, items) -> status, Seq.length items)
        |> Map.ofSeq

    let sample =
        [ { Id = Guid.NewGuid()
            Title = "Add F# fixture"
            Status = Status.Doing
            Tags = [ "standalone"; "two-face" ] }
          { Id = Guid.Empty
            Title = "Review syntax scopes"
            Status = Status.Todo
            Tags = [] } ]

    async {
        let summary = summarize sample
        printfn "Summary: %A" summary
    }
    |> Async.RunSynchronously
