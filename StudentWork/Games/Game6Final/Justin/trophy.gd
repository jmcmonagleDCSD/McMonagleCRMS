extends Area2D

@export var next_level: PackedScene


func _on_body_entered(body):
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("default")
		get_tree().change_scene_to_packed(next_level)
