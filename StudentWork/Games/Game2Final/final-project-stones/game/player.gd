extends CharacterBody2D
class_name player

# Basic movement
var max_speed = 1500
var speed = 0
var directon = Vector2.UP
var acceleration = 3
var deceleration = 2
var turn_radius = 0.05













func _ready():
	rotate(deg_to_rad(-90))


func _process(_delta):
	velocity = get_direction() * get_speed()

	
	
	
	
	
	move_and_slide()


func get_direction():
	if Input.is_action_pressed("player_left"):
		rotate(-turn_radius)
	elif Input.is_action_pressed("player_right"):
		rotate(turn_radius)
	return Vector2(cos(rotation),sin(rotation))




func get_speed():
	if Input.is_action_pressed("player_forword"):
		speed += acceleration
	elif Input.is_action_pressed("player_brake"):
		speed += deceleration * 2
	else:
		speed -= deceleration
	
		speed = clamp(speed, 0, 100)

	return speed
