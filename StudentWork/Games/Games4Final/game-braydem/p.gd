extends CharacterBody2D

var gravity = 30
var jump_height = -400


var direction = 0
var speed = 300 
func _process(delta): 
	velocity.y += gravity

	if Input.is_action_just_pressed("f"):
		velocity.y = jump_height

	if Input.is_action_just_pressed("l"):
		direction = -1 
	elif Input.is_action_pressed("shoot"):
		direction = 1
	else: 
		direction = 0
	
	velocity.x = direction + speed 
	
	move_and_slide()
func hurt ():
	pass
