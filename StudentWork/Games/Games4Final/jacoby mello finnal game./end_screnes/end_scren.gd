extends Node2D
@onready var main_menu_button: Button = $main_menu_button
@onready var replay_button: Button = $replay_button
@onready var next_button: Button = $next_button


func _process(delta: float) -> void:
	if main_menu_button.button_pressed:
		get_tree().change_scene_to_file("res://main_menu.tscn")
	if replay_button.button_pressed:
		get_tree().change_scene_to_file("res://level.tscn")
		
