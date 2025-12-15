extends CharacterBody2D


var direction = 0.02
var updown = 4.5
var max_rotate_up = -0.5
var max_rotate_down = 1.3

func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		velocity.y -= updown
		rotation -= direction
	else:
		velocity.y += updown
		rotation += direction
	
	if velocity.y > 200:
		velocity.y = 199
		print(velocity)
	elif velocity.y < -200:
		velocity.y = -199
	
	if is_on_floor():
		rotation = 0.5

	if rotation > max_rotate_down:
		await Input.is_action_just_pressed("jump")
		rotation = 1.25
	elif rotation < max_rotate_up:
		await Input.is_action_just_released("jump")
		rotation = -0.45
	
	
	move_and_slide()

func death(pause):
	scale.y -= 0.05
	scale.x -= 0.05
