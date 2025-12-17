extends CharacterBody2D

var gravity = 30
var jump_hieght = -1200


func _prosses(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_hieght
	
	move_and_slide()
	
