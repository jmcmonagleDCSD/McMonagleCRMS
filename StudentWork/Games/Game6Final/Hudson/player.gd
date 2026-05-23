extends CharacterBody2D
class_name Player

# Basic movement
@export var max_speed = 230
var speed = 0
var direction = Vector2.UP
var acceleration = 10
var deceleration = 2
var turn_radius = 1
var boosting = false

# drifting
@export var drift_speed = 10
var is_drifting = false
var last_direction = Vector2.ZERO

#reset
var off_track = false
var reset_timer = 1.5
var respawn_point = Vector2 (581.0,478.0)
var respawn_rotation = 0.0

#Multiplayer
@export_range(1,2,1) var player = 1

func _ready():
	rotate(deg_to_rad(-90))
	
	
func _process(delta):
	velocity =get_direction() * get_speed()
	
	if Input.is_action_pressed(str(player) + "_Drift"):
		print(str(player) + "Drifting")
		drift_start()
	else:
		drift_stop()
		
	if off_track:
		reset_timer -= delta
		if reset_timer <= 0:
			reset()
			
	move_and_slide()
	
	
func get_direction():
	if Input.is_action_pressed(str(player) + "_Left"):
		rotate(-turn_radius)
	elif Input.is_action_pressed(str(player) + "_Right"):
		rotate(turn_radius)
	
	if is_drifting == false:
		direction = Vector2(cos(rotation), sin(rotation))
	else:
		direction = last_direction
	return direction
	
	
func get_speed():
	if not boosting:
		if Input.is_action_pressed(str(player) + "_Forward"):
			speed += acceleration
		elif Input.is_action_pressed(str(player) + "_Brake"):
			speed -= deceleration + 5
		else:
			speed -= deceleration
			speed = clamp(speed, 0, max_speed)
			
		speed = clamp(speed, -100,max_speed)
		return speed
	else:
		return 1000
	
func drift_start():
	is_drifting = true
	last_direction = direction
	turn_radius = 0.06
	speed -= drift_speed

func drift_stop():
	is_drifting = false
	turn_radius = 0.06


func reset():
	global_position = respawn_point
	rotation = respawn_rotation
	speed = 0
	reset_timer = 0.2
	rotate(deg_to_rad(-90))
	
func boost():
	boosting = true
	$Timer.start()
	
	
	
	


func _on_timer_timeout() -> void:
	boosting = false
	pass # Replace with function body.
