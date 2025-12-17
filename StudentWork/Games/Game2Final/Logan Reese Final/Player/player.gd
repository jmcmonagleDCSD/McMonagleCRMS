extends CharacterBody2D

var gravity =  20
var jump_height = -300

func _process(_delta: float) -> void:
	velocity.y += gravity
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height

	move_and_slide()
