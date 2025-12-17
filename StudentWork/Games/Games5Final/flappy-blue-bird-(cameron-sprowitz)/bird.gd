extends CharacterBody2D

var gravity = 100
var jump_height = -300
var direction = 0
var speed = 330

func _process(delta: float) -> void:
	velocity.y = gravity 
	
	velocity.x = 150  
	
	
	if Input.is_action_pressed("fly"):     
		velocity.y += jump_height
				
	move_and_slide()
