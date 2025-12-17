extends CharacterBody2D

var gravity = 30
var jump_height = -75
var speed = 320
var direction = 8


@onready var animation = $AnimatedSprite2D

func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("junp") and is_on_floor(): 
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0
	
	velocity.x = direction * speed 
	move_and_slide()

	play_animations()


func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			animation.play("idle")
		else:
			animation.play("run")
	else:
		if velocity.y > 0:
			animation.play("fall")
		else:
			animation.play("jump")
