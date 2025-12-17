extends CharacterBody2D

var gravity = 30
var jump_height = -700

func _process(delta: float) -> void:
	velocity.y += gravity
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height 
	if velocity.y >0:
		$AnimatedSprite2D.play("Falling")
		
	else:
		$AnimatedSprite2D.play("Jump")

		
		
		
	
	move_and_slide()
