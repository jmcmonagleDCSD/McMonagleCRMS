extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

var gravity = 30
var jump_height = -600
var direction = 0
var speed = 300
var can_shoot = true
var shoot_direction = 1
var box_scene = preload("res://box.tscn")

func _process(delta):
	velocity.y += gravity
	if velocity.y > 480:
		velocity.y = 480

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height

	if Input.is_action_pressed("Left"):
		direction = -1
		animation.flip_h = true
		shoot_direction = -1
	elif Input.is_action_pressed("Right"):
		direction = 1
		animation.flip_h = false
		shoot_direction = 1
	else:
		direction = 0
		
	if Input.is_action_just_pressed("Drop"):
		var box = box_scene.instantiate()
		get_parent().add_child(box)
		box.position = position

	velocity.x = direction * speed

	move_and_slide()

	play_animations()


func play_animations():
	if is_on_floor():
			if velocity.x == 0:
				animation.play("Idle")
			else:
				animation.play("Moving")
