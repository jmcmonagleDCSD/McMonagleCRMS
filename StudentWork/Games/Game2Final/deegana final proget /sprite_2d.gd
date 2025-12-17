extends CharacterBody2D

var gravity = 90
var jump_height = -700
func _process(delta):
	velocity.y+= gravity
	
	
	if Input.is_action_pressed("jump") and is_on_floor:
		velocity.y = jump_height
	move_and_slide()
	
	
