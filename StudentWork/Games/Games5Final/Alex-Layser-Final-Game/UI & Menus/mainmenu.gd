extends Node2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://main/level_01.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI & Menus/controlsmenu.tscn")
