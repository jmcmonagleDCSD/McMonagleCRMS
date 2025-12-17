extends CharacterBody2D

var gravity = 30
var jump_height = 1200
var direction = 0

func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump"): 
		velocity.y = jump_height
		
	if Input.is_action_pressed("left"):
		velocity.y
			
	
	move_and_slide()
