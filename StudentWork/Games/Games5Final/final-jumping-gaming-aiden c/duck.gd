extends CharacterBody2D

var gravity = 30
var jump_height = -600

var direction = 0
var speed = 300
var can_be_hurt
var health


func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height
		
	if Input.is_action_pressed("left"):
		direction = -1
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		$AnimatedSprite2D.flip_h = false
	else: 
		direction = 0
		
		
	velocity.x = direction * speed
		
	move_and_slide()
	
	play_animations()
	
	
func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("Idel")
		else:
			$AnimatedSprite2D.play("run")
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play("fall")
		else:
			$AnimatedSprite2D.play("Jump")

func bounce(bounce_height):
	velocity.y = bounce_height
	
func hurt():
	pass


func die():
	get_tree(). pause = true
