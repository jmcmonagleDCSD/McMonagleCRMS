extends Node2D

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	player.can_can_dj = true
