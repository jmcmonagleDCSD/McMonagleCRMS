extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.00

@onready var animation = $AnimatedSprite2D
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	   
	if Input.is_action_just_pressed("left"):
		animation.flip_h = true 
	if Input.is_action_just_pressed("rigth"):
		animation.flip_h = false


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "rigth")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	play_animations()



func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			animation.play("idle")
		else:
			animation.play("run")
	else:
		if velocity.y > 0:
			animation.play("fall")
		else:
			animation.play("jump")
