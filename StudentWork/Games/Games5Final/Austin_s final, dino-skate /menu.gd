extends Control


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("go"):
		get_tree().change_scene_to_file("res://levels/level_one.tscn")
