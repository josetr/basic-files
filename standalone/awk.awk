BEGIN {
  FS = ","
}

$2 != "done" {
  counts[$2] += 1
}

END {
  for (status in counts) print status, counts[status]
}
