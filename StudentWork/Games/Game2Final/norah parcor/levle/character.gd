extends CharacterBody2D

var gravity = 30
var jump_height = -600
var derection = 0
var speed = 300
@onready var animation = $AnimatedSprite2D
func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
		
	if Input.is_action_pressed("left"):
		derection = -1
		animation.flip_h = true
	elif Input.is_action_pressed("right"):
		derection = 1
		animation.flip_h = false
	else:
		derection = 0
	velocity.x = derection * speed
		
	move_and_slide()
	
	play_animation()
	
func play_animation():
	if is_on_floor_only():
		if velocity.y == 0:
			animation.play_backwards("idle")
		else:
			animation.play("run")
	else:
		if velocity.y < 0:
			animation.play("fall")
		else:
			animation.play("jump")
