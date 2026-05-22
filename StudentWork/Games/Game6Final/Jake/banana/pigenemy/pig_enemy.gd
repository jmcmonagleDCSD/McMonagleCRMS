extends CharacterBody2D
var can_turn = true
var speed = 150

func _process(delta):
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
			
func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
