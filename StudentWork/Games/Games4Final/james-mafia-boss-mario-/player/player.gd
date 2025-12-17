extends CharacterBody2D

var gravity = 40
var jump_height = -750
var direction = 0
var speed = 300 
var health = 5

@onready var animation = $AnimatedSprite2D

func _process(delta): 
	velocity.y += gravity  
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
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
	
	play_animations()

func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			animation.play("idle")
		else:
			animation.play("running")
	else:
		if velocity.y > 0:
			animation.play("falling")
		else:
			animation.play("jumping")



func bounce(bounce_height):
	velocity.y = bounce_height


func hurt():
	health -= 1
	if health == 0:
		die()
	print(health)


func die():
	get_tree().paused = true
