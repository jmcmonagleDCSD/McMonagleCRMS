extends Control

var next_level = preload("res://Levels/Beginning1.tscn")


func _process(delta):
	if Input.is_action_just_pressed("Action"):
		get_tree().change_scene_to_packed(next_level)
