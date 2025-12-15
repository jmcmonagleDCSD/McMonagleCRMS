extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		await get_tree().create_timer(.2).timeout
		get_tree().change_scene_to_file("res://Screens/DeathScreen.tscn")
