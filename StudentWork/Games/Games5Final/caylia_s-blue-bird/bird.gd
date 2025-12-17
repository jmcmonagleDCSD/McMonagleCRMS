extends CharacterBody2D

var gravity= 18
var fly_height=-600

func _process(delta: float) -> void:
	velocity.y+=gravity

	if Input.is_action_just_pressed("fly"):
		velocity.y = fly_height
	move_and_slide()
