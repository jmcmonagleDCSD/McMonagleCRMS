extends CharacterBody2D

var gravity = 40
var jump_height = -875
var speed = 260
var direction = 0

var health = 5
var can_be_hurt = true

@onready var animation = $AnimatedSprite2D
 
func _process(_delta):
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
	
	
	play_animation()


func play_animation():
	if can_be_hurt:
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
	else:
		animation.play("hurting")



func bounce(bounce_height):
	velocity.y = bounce_height


func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
	if health == 0:
		await get_tree().create_timer(.2).timeout
		die()
	await get_tree().create_timer(.4).timeout
	can_be_hurt = true

func die():
	get_tree().paused = true
