extends CharacterBody2D


var gravity = 30
var jump_height = -500

var direction = 8

func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		direction = 1
	elif Input.is_action_pressed("right"):
		direction  = -1
	else:
		direction = 0
	velocity.x = direction * -400
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	position = Vector2(-644, 68)
