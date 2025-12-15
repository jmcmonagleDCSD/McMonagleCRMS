extends CharacterBody2D


var speed = 150
var can_turn = true

func _process(delta: float) -> void:
	velocity.x = speed
	
	if is_on_wall():
		if can_turn:
			speed *= -1
			can_turn = false
		
			await get_tree().create_timer(.5).timeout
			can_turn = true

	move_and_slide()
	
	change_direction()
	
func change_direction():
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hurt()
