extends CharacterBody2D

var gravity = 30
var jump_height = -750
var direction =0
var speed = 260
@onready var animation=$AnimatedSprite2D

func _process(delta: float) -> void:
	velocity.y +=gravity
	if velocity.y > 500:
		velocity.y = 500

	if Input. is_action_just_pressed("jump") and is_on_floor():
		velocity.y =jump_height
		
	if Input. is_action_pressed("run"):
		direction = -1
		animation.flip_h = true
	
	elif Input. is_action_pressed("Run"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0
	
	velocity.x = direction  * speed
	
	move_and_slide()
	
	play_anination()
func play_anination():
	if is_on_floor():
			if velocity.x ==0:
				animation.play("stop")
			else:
					animation.play("run")
