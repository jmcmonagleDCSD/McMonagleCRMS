extends Area2D


@export var next_level: PackedScene




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("dino"):
		get_tree().paused = true
		await get_tree().create_timer(1).timeout
		get_tree().paused = false
		get_tree().change_scene_to_packed(next_level)
		 
