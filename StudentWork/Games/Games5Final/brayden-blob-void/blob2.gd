extends CharacterBody2D

var speed= 300
var jump_velocity = -400
var gravity = 10
var direction

var acceleration = .1
var deceleration = .1


func _process(delta: float) -> void:
	velocity.y += gravity
	
	direction = Input.get_axis("move_left", "move_right")
	if Input.is_action_just_pressed("move_up"):
		velocity.y = jump_velocity
		$AnimatedSprite2D.play("blob_jump")
		
	velocity.x = lerp(velocity.x, speed * direction, acceleration)
	
	move_and_slide()
	set_animation()

func set_animation():
#animations
	if direction == 0:
		$AnimatedSprite2D.play("blob_idle")
	if direction != 0:
		if direction > 0:
			$AnimatedSprite2D.play("blob_move")
			$AnimatedSprite2D.scale.x = 1
		elif direction < 0:
			$AnimatedSprite2D.play("blob_move")
			$AnimatedSprite2D.scale.x = -1
