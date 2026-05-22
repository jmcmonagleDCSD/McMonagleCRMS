extends CharacterBody2D

var Fall_speed = 60
var Jump_height = -1300

func _process(delta: float) -> void:
	velocity.y += Fall_speed
	
	if Input. is_action_pressed("Right"):
		velocity.x = 400
	elif Input.is_action_pressed("Left"):
		velocity.x = -400
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("Jump"):
		velocity.y = Jump_height
	move_and_slide()
