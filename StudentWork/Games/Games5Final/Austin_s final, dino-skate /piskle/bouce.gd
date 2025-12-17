extends Area2D



@export var bouce_hight = -800


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("dino"):
		if body.velocity.y > 0: 
			body.bouce(bouce_hight)
			$AnimatedSprite2D.play("bounce") 
