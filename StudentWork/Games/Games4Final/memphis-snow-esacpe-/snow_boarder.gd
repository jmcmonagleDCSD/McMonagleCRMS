extends CharacterBody2D

var gravity = 50

var jump_height = -750
var direction = 0 
var speed = -1200
var derection = 6
	
	
	 
func _process(delta):
	velocity.y += gravity 
	
	if Input.is_action_just_pressed("jump"): 
	
		velocity.y = jump_height 
		
	if Input.is_action_just_pressed("right"): 
		velocity.x = 267
	direction = 1
		
	move_and_slide()

	
	
