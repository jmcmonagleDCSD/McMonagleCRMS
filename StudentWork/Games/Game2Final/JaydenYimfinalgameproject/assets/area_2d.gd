extends CharacterBody2D

var gravity = 20
var jump_height = -450

func _process(delta: float) -> void:
	velocity.y += gravity
	
	
	if Input.is_action_pressed("jump"):
		velocity.y = jump_height
		
	move_and_slide()
