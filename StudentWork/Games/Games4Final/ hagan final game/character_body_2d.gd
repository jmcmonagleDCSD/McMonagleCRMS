extends CharacterBody2D


var gravity = 30
var jump_height = -650
var direction = 0
var speed = 300
var health = 5
func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump2"):
		if is_on_floor():
			velocity.y = jump_height
	
	if Input.is_action_pressed("left2"):
		direction = -1
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("right2"):
		direction = 1
		$AnimatedSprite2D.flip_h = false
	else:
		direction = 0 
	
	velocity.x = direction * speed
	
	_animations()
	
	move_and_slide()

func _animations():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idle2")
		else:
			$AnimatedSprite2D.play("run2")
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play("fall2")
		else:
			$AnimatedSprite2D.play("jump2") 
	
