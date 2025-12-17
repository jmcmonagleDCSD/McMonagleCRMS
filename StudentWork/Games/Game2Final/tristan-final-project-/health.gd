extends Control



func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("flaper")
	$HBoxContainer/Label.text = str(player.health)
