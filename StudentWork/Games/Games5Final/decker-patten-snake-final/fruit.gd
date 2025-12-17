extends Area2D

signal respawn
var player

func _on_body_entered(body: Node2D) -> void:
	respawn.emit()
	player.add_segemtent()
	queue_free()
func _ready() -> void:
	player = get_tree().get_first_node_in_group("snake")
	
