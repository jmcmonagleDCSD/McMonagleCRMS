extends CharacterBody2D

@export var next_level: PackedScene

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().paused = true
		get_tree().change_scene_to_packed(next_level)
