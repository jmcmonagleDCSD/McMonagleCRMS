extends CharacterBody2D

var can_play = true
var jump_height = -500
var gravity = 20
var direction = 1
var speed = 230
var maximum_y = 1000
var can_dj = false
var can_can_dj = false
var jumps

func _process(delta: float) -> void:
	velocity.y += gravity
	if can_play:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_height
			jumps -= 1
			if can_can_dj:
				can_dj = true
		elif Input.is_action_just_pressed("jump") and not is_on_floor() and can_dj and jumps > 0:
			velocity.y= jump_height
			jumps -= 1
		elif Input.is_action_pressed("right"):
			direction = 1
			$AnimatedSprite2D.flip_h = false
		elif Input.is_action_pressed("left"):
			direction = -1
			$AnimatedSprite2D.flip_h = true
		else:
			direction = 0
	else:
		direction = 0
	if position.y > maximum_y:
		Global.reset.emit()
		position = Vector2(49, 144)
		velocity.y = 0
	if can_can_dj:
		can_dj = true
	velocity.x = direction * speed
	play_animations()
	move_and_slide()

func play_animations():
	if is_on_floor():
		if can_can_dj:
			jumps = 1
		else:
			jumps = 0
		if velocity.x == 0:
			direction = 0
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		if velocity.y > 0:
			$AnimatedSprite2D.play("fall")
	
