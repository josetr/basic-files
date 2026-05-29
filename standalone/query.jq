map(select(.status != "done"))
| group_by(.status)
| map({
    status: .[0].status,
    count: length,
    titles: map(.title)
  })
