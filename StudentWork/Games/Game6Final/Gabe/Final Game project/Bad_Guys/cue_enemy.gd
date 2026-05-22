extends CharacterBody2D

var speed = 200

func _process(delta: float) -> void:
	if is_on_wall():
		speed *= -1
	
	
	velocity.x = speed
	move_and_slide()
	
	
	

	
