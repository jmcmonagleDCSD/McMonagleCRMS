extends Node2D


func _process(_delta):
	
	var mouse = get_global_mouse_position()
	look_at(mouse)
