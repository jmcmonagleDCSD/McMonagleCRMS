extends CharacterBody2D


const SPEED = 170.0
const JUMP_VELOCITY = -300.0

var candoublejump = false
var numberofjumps = 1


func _physics_process(delta: float) -> void:
	
	velocity.x = SPEED
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("jump") and numberofjumps>0:
		velocity.y = JUMP_VELOCITY
		numberofjumps -= 1
		$AnimatedSprite2D.frame += 1
		if $AnimatedSprite2D.frame >3:
			$AnimatedSprite2D.frame = 0
	
	move_and_slide()
	if is_on_floor():
		numberofjumps = 1
	
	
	
func unlockdoublejump():
	numberofjumps = 1
	pass
