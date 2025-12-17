extends Area2D

@export var bounce_height = -1500

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.bounce(bounce_height)
		$AnimatedSprite2D.play("bounce")
