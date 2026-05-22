extends CharacterBody2D
var speed =40
var can_turn = true
func _process(delta: float) -> void:



	velocity.x -= speed
	if is_on_wall():
		if can_turn:
			can_turn=false
			speed*=-1
			await get_tree().create_timer(.2).timeout
			can_turn = true
	move_and_slide()


	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://menu.tscn")
