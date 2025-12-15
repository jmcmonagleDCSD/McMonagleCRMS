extends Control

@export var first_level: PackedScene

func _process(delta):
	if Input.is_action_just_pressed("Action"):
		get_tree().change_scene_to_packed(first_level)

func _ready() -> void:
	Score.hide()
	Score.score = 0
