extends Area2D

@export var bounce_height = -900

func _on_body_entered(body: Node2D) -> void:
	print("true")
	if body.is_in_group("player"):
		if body.velocity.y > 0: 
			body.bounce(bounce_height)
			$AnimatedSprite2D.play("bounce")
