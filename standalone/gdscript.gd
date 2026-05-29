extends Node

enum Status { TODO, DOING, DONE }

func _ready() -> void:
    var status := Status.DOING
    print("status=%s" % status)
