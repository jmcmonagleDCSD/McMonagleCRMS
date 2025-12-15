extends CharacterBody2D

var gravity = 70
var jump_hight = -1600
func _process(_delta: float) -> void:
	velocity.y += gravity
	velocity.x += 23
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = jump_hight
	
	if is_on_floor():
		$AnimatedSprite2D.play("Run")
	else:
		if velocity.y <0:
			$AnimatedSprite2D.play("jump")
			
	
	move_and_slide()
