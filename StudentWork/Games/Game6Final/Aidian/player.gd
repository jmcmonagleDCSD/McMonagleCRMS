extends CharacterBody2D

var gravity = 30
var jump_hight = -600
var direction = 0
var speed = 300
@onready var animation = $AnimatedSprite2D
func _process(delta):
	velocity.y += gravity
	
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_hight
	
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
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")
	else:
		if velocity.y > 0:
			animation.play("fall")
		else:
			animation.play("jump")
		
		
		
		
		
func bounce(bounce_hight):
	velocity.y = bounce_hight
