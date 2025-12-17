extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("play"):
		get_tree().change_scene_to_file("res://node_2d.tscn")
		
