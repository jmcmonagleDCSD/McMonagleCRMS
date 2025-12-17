extends CharacterBody2D

var gravity = 60
var jump_height = -1100

func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height

	
	
	if is_on_floor():
		$AnimatedSprite2D.play("running")
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("Jump")
		else:
			$AnimatedSprite2D.play("fall")

	move_and_slide()
