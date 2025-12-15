extends Area2D

@export var next_level: PackedScene



func _on_body_entered(body):
	if body.is_in_group("Astroman"):
		get_tree().change_scene_to_file("res://level_7.tscn")
