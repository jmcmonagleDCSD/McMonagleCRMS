extends CharacterBody2D

var gravity = 50
var jump_hieght = -1500
var direction = 0
var speed = 800
@onready var animation = $AnimatedSprite2D



func _process(delta):
	velocity.y +=gravity
	if Input.is_action_just_pressed("jump") and is_on_floor()or is_on_wall():
		velocity.y = jump_hieght
	
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0
	
	velocity.x = direction * speed
	
	
	
	
	move_and_slide()
	


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	position = Vector2(316,513)
