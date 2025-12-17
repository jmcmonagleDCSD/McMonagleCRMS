extends CharacterBody2D

var gravity = 3
var jump_height = -225

func _process(delta: float) -> void:
	velocity.y = velocity.y + gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	
	if is_on_floor():
		$AnimatedSprite2D.play("running")
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		else:
			$AnimatedSprite2D.play("fall")
	
	
	
	
	move_and_slide()
