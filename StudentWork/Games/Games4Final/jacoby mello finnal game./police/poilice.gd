extends Node2D

@onready var area_2d: Area2D = $Area2D


func _process(delta: float) -> void:
	if area_2d.has_overlapping_bodies():
		get_tree().change_scene_to_file("res://end_scren.tscn")
 
