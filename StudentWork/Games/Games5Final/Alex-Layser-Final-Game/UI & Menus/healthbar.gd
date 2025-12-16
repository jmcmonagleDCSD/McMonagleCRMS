extends Control

func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	$HBoxContainer/Label2.text = str(player.health)
