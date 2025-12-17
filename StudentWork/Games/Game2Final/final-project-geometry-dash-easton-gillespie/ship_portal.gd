extends Area2D

var spawn_point
@export var ship:PackedScene





func _on_body_entered(body: Node2D) -> void:
	spawn_point = body.position + Vector2(30,0)
	body.queue_free()
	var player = ship.instantiate()
	get_tree().root.add_child(player)
	player.position = spawn_point
	
