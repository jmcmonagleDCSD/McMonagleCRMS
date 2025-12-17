extends CharacterBody2D

var gravity = 30
var jump_height = -650
var direction = 0
var speed = 300

@onready var animation = $AnimatedSprite2D

func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_height
	
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = false
	elif Input.is_action_pressed("right"):
		direction = 1
		animation.flip_h = true
	else:
		direction = 0
	
	velocity.x = direction * speed
	
	move_and_slide()
	
	play_animations()
	
func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			animation.play("Idle")
		else: 
			animation.play("Running")
	else:
		if velocity.y > 0:
			animation.play("Fall")
		else:
			animation.play("jump")


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://menu/menu.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	position = Vector2(247.0, 927.0)
