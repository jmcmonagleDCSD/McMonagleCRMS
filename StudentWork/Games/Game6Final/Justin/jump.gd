extends Area2D

@export var bounce_hieght = -1400

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.bounce(bounce_hieght)
