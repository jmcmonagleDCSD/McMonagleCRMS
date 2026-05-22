extends TextureRect


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("change screen"):
		get_tree().change_scene_to_file("res://Levels/level_one.tscn")
	if Input.is_action_just_pressed("quit"):
		get_tree().change_scene_to_file("res://Levels/levelchooser.tscn")
