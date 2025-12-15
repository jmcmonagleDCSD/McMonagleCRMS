extends Node2D

@onready var replay_button: Button = $replay_button
@onready var maen_menu_button: Button = $maen_menu_button

func _process(delta: float) -> void:
	if replay_button.button_pressed:
		get_tree().change_scene_to_file("res://level.tscn")
	if maen_menu_button.button_pressed:
		get_tree().change_scene_to_file("res://main_menu.tscn")
