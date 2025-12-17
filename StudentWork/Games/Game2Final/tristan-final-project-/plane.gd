extends CharacterBody2D

var jump_force = 150
var gravity = 3

var can_be_hurt = true
var health = 3

func _process(delta: float) -> void:
	velocity.y += gravity
	if velocity.y > 100:
		velocity.y = 100
	
	
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_force



	



	move_and_slide()
	
