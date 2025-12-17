extends CharacterBody2D

var gravity = 30
var jump_height = -800
var direction = 0
var speed = 300
func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump"): 
		velocity.y = jump_height
	
	if Input.is_action_pressed("move (left)"):
		direction = -1
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_just_pressed("move (right)"):
		direction = 1
		$AnimatedSprite2D.flip_h = false
	else:
		direction = 0 
	
	
	velocity.x = direction * speed
	move_and_slide()
	
	play_animation()
	
func play_animation():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run ")
	else:
			if velocity.y > 0:
				$AnimatedSprite2D.play("fall")
			else:
				$AnimatedSprite2D.play("jump")

 
