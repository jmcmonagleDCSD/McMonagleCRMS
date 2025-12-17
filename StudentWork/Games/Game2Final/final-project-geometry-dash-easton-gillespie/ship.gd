extends CharacterBody2D



const SPEED = 170.0
const JUMP_VELOCITY = -300.0




func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("boost")
	else: $AnimatedSprite2D.play("fly")
	velocity.x = SPEED
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
