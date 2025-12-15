extends Node2D

@export var next_level: PackedScene


func _process(_delta):
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://level.tscn")
