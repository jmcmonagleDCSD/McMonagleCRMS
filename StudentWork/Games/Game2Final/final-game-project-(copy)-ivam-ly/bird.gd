extends CharacterBody2D
var gravity = 99
var jump_height = -0.01


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		velocity.y=-0.08
	move_and_slide()
