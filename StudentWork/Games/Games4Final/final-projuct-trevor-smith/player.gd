extends CharacterBody2D


var gravity = 30
var jump_height = -1000
@onready var animation = $AnimatedSprite2D

var dierection = 0
var speed = 300

func _process(_delta: float) -> void:
	velocity.y += gravity
	if velocity.y >450:
		velocity.y =450
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height
	 
	if Input.is_action_pressed("left"):
		animation.flip_h = true
		dierection= -1
	elif Input.is_action_pressed("Right"):
		dierection = 1
		animation.flip_h = false
	else:
		dierection = 0
		
	velocity.x = dierection * speed
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


func bounce(bounce_height):
	velocity.y=bounce_height
	
	
	
	
