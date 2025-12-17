extends CharacterBody2D


var gravity = 30
var jump_height = -1200



var direction = 0
var speed = 300
func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("up")and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		velocity.x = speed
	elif Input.is_action_pressed("right"):
		velocity.x = -speed
	else:
		velocity.x =0
	move_and_slide()
