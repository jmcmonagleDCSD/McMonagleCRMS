extends CharacterBody2D

var gravaty = 30
var jump_hight = -1200
var direction = 0
var speed = 500





@onready var animation = $AnimatedSprite2D

func _process(delta):
	velocity.y += gravaty
	
	if Input .is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_hight
	
	if Input .is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input .is_action_pressed("right"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0
	
	velocity.x = direction * speed
	
	
	
	move_and_slide()
	
	play_animation()






func play_animation():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idle")
		else:
			animation.play("run")
	else:
		if velocity.y > 0: 
			animation.play("fall")
		else:
			animation.play("jump")
	
	
	
func bounce(bounce_hight):
	velocity.y = bounce_hight
	if velocity.y > 0:
		velocity.y = bounce_hight

func hurt():
	pass
