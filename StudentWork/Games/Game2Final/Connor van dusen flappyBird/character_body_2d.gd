extends CharacterBody2D

@export 

var gravity = 24
var flap_2_height = -350 

var direction = 0

func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("flap"):
		velocity.y = flap_2_height
		if velocity.y < 0:
			$AnimatedSprite2D.play("flap_2")
		
	
	move_and_slide()
	
