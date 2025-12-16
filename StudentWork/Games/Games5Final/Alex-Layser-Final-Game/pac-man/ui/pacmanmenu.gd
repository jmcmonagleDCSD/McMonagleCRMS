extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://pac-man/levels/pacmanmap.tscn")
	elif Input.is_action_just_pressed("leave"):
		get_tree().change_scene_to_file("res://main/level_01.tscn")
		


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://pac-man/ui/pacmanguide.tscn")
