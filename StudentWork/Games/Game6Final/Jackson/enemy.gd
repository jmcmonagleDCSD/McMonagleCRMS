extends CharacterBody2D
var speed = 5000
var can_turn = true
func _process(delta):
	velocity.x = speed
	
	
	
	if is_on_wall():
		if can_turn:
			can_turn = false
			speed *= -1
			await get_tree().create_timer(.5).timeout
			can_turn = true
	move_and_slide()


	play_animation()


func play_animation():
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
