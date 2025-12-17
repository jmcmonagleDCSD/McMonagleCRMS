extends CharacterBody2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y -= 20
