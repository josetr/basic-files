enum Status:
  case Todo, Doing, Done

@main def run(): Unit =
  println(Status.Doing)
