extends CharacterBody2D


var gravity = 20
var jump_height = -750

var health = 1
var can_be_hurt = true

func _process(_delt):
	velocity.y += gravity
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height
		$AnimatedSprite2D.play("flying") 


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
