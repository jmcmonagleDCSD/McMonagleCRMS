extends Area2D


@export var home = PackedScene



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("dino"):
		get_tree().paused = true
		$AnimatedSprite2D.play("win")
		await get_tree().create_timer(3).timeout
		get_tree().paused = false
		get_tree().change_scene_to_packed(home)
