extends CharacterBody2D

var gravity = 30
var jump_height = -600 
var health = 1
var can_be_hurt = true

func _process(_delta):
	velocity.y += gravity
	
	if Input.is_action_pressed("Jump")and is_on_floor():
		velocity.y = jump_height
	
	
	move_and_slide()
	play_animations()
	
	velocity.x = 300

func play_animations():
	if can_be_hurt:
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Hurt")

func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
		if health == 0:
			await get_tree().create_timer(.3).timeout
			die()
		can_be_hurt = true
	
func die():
	get_tree().change_scene_to_file("res://front_page.tscn")
	
