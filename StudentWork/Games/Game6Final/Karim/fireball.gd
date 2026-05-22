extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.hurt()
	if body.is_in_group("Orb"):
		queue_free()
		body.queue_free() 
