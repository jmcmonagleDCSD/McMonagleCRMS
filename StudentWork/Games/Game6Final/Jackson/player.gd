extends CharacterBody2D


var fall_speed = 30
var jump_height = -1200
var direction = 0
var speed = 300
var health = 3
var can_be_hurt = true
@onready var animation = $AnimatedSprite2D
func _process(delta: float) -> void:
	velocity.y += fall_speed
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input.is_action_pressed("Right"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0
		
		
	
	
	
	velocity.x = direction * speed
	move_and_slide()
	
	play_animations()
	print(can_be_hurt)

func play_animations():
	if can_be_hurt:
		if is_on_floor():
			if velocity.x == 0:
				$AnimatedSprite2D.play("Idle")
			else:
				$AnimatedSprite2D.play("Run")
		else:
				if velocity.y > 0:
					$AnimatedSprite2D.play("fall")
				else:
					$AnimatedSprite2D.play("Jump")
	else:
		animation.play("hurt")
func bounce(bounce_height):
	
	position.y = bounce_height

func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
		if health == 0:
	
			die()
	await get_tree().create_timer(.10).timeout
	can_be_hurt = true
func die():
	get_tree().paused = true
