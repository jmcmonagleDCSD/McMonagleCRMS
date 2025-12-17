extends CharacterBody2D
var gravity = 7
var jump_height = -150



var health = 1
var can_be_hurt = true

func _process(_delta):
	velocity.y += gravity   
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height
		$AnimatedSprite2D.play("flying")
	
	
	

	move_and_slide()


func hurt():
	if can_be_hurt:
		can_be_hurt= false
	health -= 1
	if health == 0:
		die()
	
func die():
	get_tree().paused = true
	
	move_and_slide()
