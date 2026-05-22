extends Area2D

@export var Level = PackedScene 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("win")
		body.can_play = false
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_packed(Level)
