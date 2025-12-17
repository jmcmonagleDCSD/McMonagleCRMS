extends Node2D



func _process(delta: float) -> void:
	position.x -= 1.9
	
func _on_body_entered(body: Sprite2D) -> void:

		get_tree().change_scene_to_file("res://menu.tscn")
