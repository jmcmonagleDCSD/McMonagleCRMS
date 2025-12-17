extends Control
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly"):
		get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
