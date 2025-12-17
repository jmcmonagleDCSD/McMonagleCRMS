extends Control


func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("dino")
	$"HBoxContainer/healthAmount".text = str(player.health)
