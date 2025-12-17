extends CharacterBody2D


var gravity = 100
var jump_height = -1500
func _process(delta):
	velocity.y += gravity

func _physics_process(delta: float) -> void:
	position.x += 4
	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	
	
	
	if is_on_floor():
		$AnimatedSprite2D.play("running")
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("jumping")
		else:
			$AnimatedSprite2D.play("falling")
	move_and_slide()
