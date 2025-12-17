extends CharacterBody2D

var gravity = 15
var jump_height = -300

func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_pressed("jump"):
		velocity.y = jump_height
	
	
	
	move_and_slide()


func play_animations():
	if !is_on_floor():
		$AnimatedSprite2D.play("Jump")
