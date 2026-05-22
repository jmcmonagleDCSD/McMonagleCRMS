extends Node2D
@export var bounce_height = -1000



func _on_body_entered(body):
	if body.is_in_group("player"): 
		body.bounce(-1000) 
		$trampoline.play("bounce")
