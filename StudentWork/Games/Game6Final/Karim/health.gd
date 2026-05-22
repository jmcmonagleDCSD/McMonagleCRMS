extends Control

func _process(_delta):
	var player = get_tree().get_first_node_in_group("Player")
	$HBoxContainer/HealthAmountLabel.text = str(player.health)
