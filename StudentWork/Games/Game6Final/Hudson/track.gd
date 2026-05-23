extends Node2D
		



func _on_safe_body_exited(body: Node2D) -> void:
	if body is Player:
		body.max_speed = body.max_speed / 2
		body.off_track = true


func _on_safe_body_entered(body: Node2D) -> void:
	if body is Player:
		body.max_speed = body.max_speed * 2
		body.off_track = false
		body.reset_timer = 0.2
