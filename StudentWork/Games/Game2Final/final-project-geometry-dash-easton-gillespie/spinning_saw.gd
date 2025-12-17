extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://level.tscn")
	
	move_and_slide()
	
	
	
func play_animations():
	if velocity.y = 0:
		play_animations("spin")
