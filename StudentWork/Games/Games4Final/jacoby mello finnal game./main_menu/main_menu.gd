extends Control

@onready var how_to_play: Control = $"how to play"

@onready var how_to_play_button: Button = $how_to_play_button
@onready var play_button: Button = $play_button
@onready var exit_button: Button = $"how to play/exit_button"

func _process(delta: float) -> void:
	if how_to_play_button.button_pressed:
		how_to_play.visible = true
	if exit_button.button_pressed:
		how_to_play.visible = false
	if play_button.button_pressed:
		get_tree().change_scene_to_file("res://level.tscn")
