extends CharacterBody2D

var jump_hieght = -600
var gravity = 30
var speed = 300
var direction = 0
var health = 5
var can_be_hurt = true

func _process(delta: float) -> void:
	velocity.y += gravity
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_hieght
	
	if Input.is_action_pressed("Left"):
		direction = -1
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("Right"):
		direction = 1
	else:
		direction = 0
		$AnimatedSprite2D.flip_h = false
	velocity.x = direction * speed

	move_and_slide()
	

	play_animations()
func play_animations():
	if can_be_hurt:
		if is_on_floor():
			if velocity.x == 0:
				$AnimatedSprite2D.play("Idle")
			else:
				$AnimatedSprite2D.play("Run")

	
func hurt():
	health -= 1
	can_be_hurt = false
	if health == 0:
		
		
		die()
	await get_tree().create_timer(.05).timeout
	can_be_hurt = true
	
func die():
	get_tree().change_scene_to_file("res://menu.tscn")
	
	
 
		

		
	


	 

	
	

		
