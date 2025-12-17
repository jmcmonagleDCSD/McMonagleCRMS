extends CharacterBody2D

var gravity = 30
var jump_height = -600

var direction = 0
var speed = 300

var health = 3
var can_be_hurt = true

var score = 0
var bar

@onready var animation = $AnimatedSprite2D

func _process(delta):
	velocity.y += gravity
	if velocity.y > 500:
		velocity.y = 500
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height
		$AudioStreamPlayer.play()
	
	if Input.is_action_pressed("Left"):
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
				animation.play("Idle")
			else: animation.play("Run")
		else:
			if velocity.y > 0:
				animation.play("Fall")
			else:
				animation.play("Jump")
	else:
		animation.play("Hurt")
		$AudioStreamPlayer2.play()

func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
		await get_tree().create_timer(.4).timeout
		if health == 0:
			die()
		can_be_hurt = true

func die():
	get_tree().change_scene_to_file("res://Screens/DeathScreen.tscn")
