extends Control


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		get_tree().change_scene_to_file("res://Final Game project/level_folder/level_1.tscn")
