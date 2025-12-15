extends Control



func _process(delta):
	if Input.is_action_just_pressed("up"):
		get_tree().change_scene_to_file("res://level_1.tscn")
