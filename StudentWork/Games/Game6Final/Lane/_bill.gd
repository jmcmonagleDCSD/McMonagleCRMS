extends CharacterBody2D

var gravtiy = 30
var jump_height = -500
var direction = 0
var speed = 30

func _process(delta: float) -> void:
	
	velocity.y += gravtiy
	if velocity.y > 500:
		velocity.y = 500
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_height 
	if Input.is_action_pressed("run"):
		direction =  10
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("back"):
		direction = -10
		$AnimatedSprite2D.flip_h = true
	else:
		direction = 0
	
	velocity.x = direction * speed
	
	
	move_and_slide()
	
	play_animations()




func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idel")
		else:
			$AnimatedSprite2D.play("run")
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play("fall")
		else:
			$AnimatedSprite2D.play("jump")

func bounce(bounce_hight):
	velocity.y = bounce_hight
