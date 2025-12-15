extends CharacterBody2D

var gravity = 30
var jump_hieght = -600
var direction = 0
var speed = 340
@onready var animation = $AnimatedSprite2D
var can_be_hurt = true
var health = 0

func _process(delta): 
	velocity.y += gravity
	if velocity.y> 500:
		velocity.y = 500
	if Input.is_action_pressed("jump") and is_on_floor():
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
	
	play_animation()
	
func play_animation():
	if can_be_hurt:
		if is_on_floor():
			if velocity.x == 0:
				animation.play("Idle")
			else: 
				animation.play("Running")
		else:
			if velocity.y > 0: 
				animation.play("Falling") 
	else: 
		animation.play("Hurt")

func bounce(bounce_height):
	if velocity.y > 0: 
		velocity.y = bounce_height
		
func hurt():
	if can_be_hurt: 
		health -= 1
		can_be_hurt = false
		if health == 0:
			die()
		await get_tree().create_timer(.4).timeout
		can_be_hurt = true 
		
func die():
	get_tree().paused = true
	
			
			
			

		
		
		
		
		
	


	
