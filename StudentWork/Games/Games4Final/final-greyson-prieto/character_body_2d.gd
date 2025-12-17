extends CharacterBody2D


func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		velocity.y -= 50
	else:
		velocity.y += 10
		
		
	move_and_slide()
