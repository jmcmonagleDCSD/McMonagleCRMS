extends Node2D


@export var pipes_scene:PackedScene


func _on_timer_timeout() -> void:
	var x_pos = $Marker2D.position.x
	var y_pos = randi_range($Marker2D.position.y, $Marker2D2.position.y)
	var new_pos=Vector2(x_pos, y_pos)
	
	
	var pipes_scene = pipes_scene. instantiate()
	add_child(pipes_scene)
	pipes_scene.position = new_pos
