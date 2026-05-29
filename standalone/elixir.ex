defmodule BasicFiles do
  @status_pattern ~r/^(?<status>todo|doing|done):\s+(?<title>.+)$/u

  def summarize(tasks) do
    Enum.frequencies_by(tasks, & &1.status)
  end

  def parse(line) do
    with %{"status" => status, "title" => title} <- Regex.named_captures(@status_pattern, line) do
      {:ok, %{title: title, status: String.to_existing_atom(status)}}
    else
      _ -> {:error, {:invalid_task, line}}
    end
  end
end

tasks =
  ["doing:Add Elixir fixture", "todo:Review regex scopes"]
  |> Enum.map(&BasicFiles.parse/1)
  |> Enum.flat_map(fn
    {:ok, task} -> [task]
    {:error, _reason} -> []
  end)

IO.inspect(BasicFiles.summarize(tasks))
