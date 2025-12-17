extends CharacterBody2D

var speed = 325

@onready var animation = $AnimatedSprite2D
func _process(_delta: float) -> void:
	var animation = $AnimatedSprite2D

	if Input.is_action_just_pressed("down"):
		velocity.y = speed

	if Input.is_action_just_pressed("up"):
		velocity.y = -speed

	if Input.is_action_just_pressed("left"):
		velocity.x = -speed

	if Input.is_action_just_pressed("right"):
		velocity.x = speed
	move_and_slide()
