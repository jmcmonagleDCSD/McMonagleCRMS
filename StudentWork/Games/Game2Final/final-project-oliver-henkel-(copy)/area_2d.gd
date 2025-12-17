extends Area2D

var spawn_position
@export var ship_gamemode:PackedScene

func _on_body_entered(body: Node2D) -> void:
	spawn_position = body.position
	body.queue_free()
	var player = ship_gamemode.instantiate()
	get_tree().root.add_child(player)
	player.position = spawn_position
