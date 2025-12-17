extends CharacterBody2D

# Basic movement
var speed = 0
var direction = Vector2.UP


func _ready():
	rotate(deg_to_rad(-90))

func _process(delta):
	velocity = get_direction() * get_speed()
	
	move_and_slide()
	
	
func get_direction():
	if Input.is_action_pressed("player_left"):
		rotate(-0.03)
	elif Input.is_action_pressed("player_right"):
		rotate(0.03)
		
	direction = Vector2(cos(rotation), sin (rotation))
	return direction
	
	
func get_speed():
	if Input.is_action_pressed("player_forward"):
		speed +=10
	elif Input.is_action_pressed("player_brake"):
		speed -= 10
	else:
		speed -= 10
		
	speed = clamp(speed, 0, 700)
	return speed
		
		
