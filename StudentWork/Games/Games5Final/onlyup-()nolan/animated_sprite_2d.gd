extends CharacterBody2D

var gravity = 30
var jump_height = -1150

var direction = 0
var speed = 550
func _process(_delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump")and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
	
	velocity.x = direction * speed
	
	move_and_slide()
