extends CharacterBody2D


var speed = 0
var direction = Vector2 (0,-1)

func _process(_delta):
	velocity = get_direction() * get_speed()
	
	move_and_slide()
	
func get_direction():
	return Vector2.ZERO
	
	
func get_speed():
	if Input.is_action_pressed("player_1_forward"):
		speed += 20
	elif Input. is_action_pressed("player_1_break"):
		speed += 20
	return speed
