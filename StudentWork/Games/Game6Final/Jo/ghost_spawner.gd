extends Node2D

@export var ghost_s: PackedScene



func _on_timer_timeout() -> void:
	var ramdom_pos_x = randi_range($Marker2D.position.x,$Marker2D2.position.x)
	var ram_pos = Vector2(ramdom_pos_x,$Marker2D.position.y)
	var ghost = ghost_s.instantiate()
	add_child(ghost)
	ghost.position = ram_pos
