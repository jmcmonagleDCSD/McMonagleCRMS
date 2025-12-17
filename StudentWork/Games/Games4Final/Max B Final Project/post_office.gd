extends Node2D


@export var next_level: PackedScene



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Truck"):
		get_tree().paused = true
		await get_tree().create_timer(.1).timeout
		get_tree().paused = false
		get_tree().change_scene_to_packed(next_level)
