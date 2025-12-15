extends CharacterBody2D

var jump_height = -575
var gravity = 25
var speed= 350
var direction = 0
var number_of_bounces = 4
var jumped = false
var health = 5
var can_be_hurt = true
var bounce_height = jump_height/3
var scorecollect = true
var score = 0
var addhealth1 = true
func _process(delta: float) -> void:
	velocity.y += gravity
	if velocity.y > 500:
		velocity.y = 500		
		
	if Input.is_action_just_pressed("jump") and jumped == false and is_on_floor() and number_of_bounces == 4:
		print("true")
		velocity.y = jump_height
		number_of_bounces -= 1
		await get_tree().create_timer(.3).timeout
		jumped = true
		
	if number_of_bounces > 0 and jumped == true and is_on_floor():
		number_of_bounces -= 1
		velocity.y = bounce_height
		if number_of_bounces == 0:
			jumped = false
			number_of_bounces = 4
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
	if can_be_hurt:
		if is_on_floor():
			if velocity.x == 0:
				$AnimatedSprite2D.play("idle")
			else:
				$AnimatedSprite2D.play("roll")
		else:
			if velocity.y > 0:
				$AnimatedSprite2D.play("fall")
			else:
				$AnimatedSprite2D.play("jump")
	else:
		$AnimatedSprite2D.play("hurt")
func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
		if health == 0:
			await get_tree().create_timer(.1).timeout
			die()
			return
		await get_tree().create_timer(.1).timeout
		can_be_hurt = true
func die():
	get_tree().change_scene_to_file("res://game_over.tscn")
func collect():
	if scorecollect:
		score += 1
func addhealth():
	if addhealth1:
		health += 1
	
