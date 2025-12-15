extends Node2D

@export var missle: PackedScene



func _on_timer_timeout() -> void:
	var y_pos = $Marker2D2.position.y
	var x_pos = randi_range($Marker2D2.position.x, $Marker2D.position.x)
	var new_pos = Vector2(x_pos, y_pos)
	
	var enemy = missle.instantiate()
	add_child(enemy)
	enemy.position = new_pos
