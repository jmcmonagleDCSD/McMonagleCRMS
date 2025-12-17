extends Control


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("first"):
		get_tree().change_scene_to_file("res://levels/level_one.tscn")
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://levels/menu.tscn")
