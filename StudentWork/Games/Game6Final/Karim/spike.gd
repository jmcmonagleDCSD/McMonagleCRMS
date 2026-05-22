extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.hurt()
	if body.is_in_group("Orb"):
		queue_free()
		body.queue_free()
