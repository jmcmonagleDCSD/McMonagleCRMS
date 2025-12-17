extends CharacterBody2D

var gravity = 30
var jump_height = -800

var direction = 0
var speed = 300


@onready var animation = $AnimatedSprite2D

func _process(_delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
	
	velocity.x = direction * speed
	
	move_and_slide()
	
	play_animation()
	
func play_animation():
	if is_on_floor():
		if velocity.x == 0:
			animation.play("idle")
		else:
			animation.play("moving ")
	else:
		animation.play ("jump")
