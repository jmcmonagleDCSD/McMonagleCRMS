extends Node2D



func _process(_delta: float) -> void:
	if $Area2D5.has_overlapping_bodies():
		if Input.is_action_pressed("interact"):
			get_tree().change_scene_to_file("res://flappybird/ui/flappymenu.tscn")
	elif $Area2D.has_overlapping_bodies():
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://pac-man/ui/pacmanmenu.tscn")
