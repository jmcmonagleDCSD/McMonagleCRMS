extends Control

var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
func _process(delta: float) -> void:
	$HBoxContainer/HealthAmountLabel.text = str(player.health)
