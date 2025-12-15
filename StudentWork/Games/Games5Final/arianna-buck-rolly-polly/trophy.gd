extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("win")
		await get_tree().create_timer(.5).timeout
		get_tree().change_scene_to_file("res://win.tscn")
