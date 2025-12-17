extends Node2D


@export var pipes_scene:PackedScene
var y_pos=$Marker2D.position.y
var x_pos=randi_range($Marker2D.position.y,$Marker2D2.position.y)
var new_pos = Vector2(x_pos, y_pos)
func _on_timer_timeout() -> void:
	var pipes = pipes_scene.instantiate()
	add_child(Area2D)
	pipes.position =new_pos
