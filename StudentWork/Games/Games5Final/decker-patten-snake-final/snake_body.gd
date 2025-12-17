extends Area2D

var follow_speed = .2
var target = Vector2.ZERO

func _process(delta: float) -> void:
	global_position = global_position.lerp(target, follow_speed)
	
