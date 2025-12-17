extends Node2D

	
func _process(_delta):
	position.x +=-3
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("blue bird"):
		get_tree().change_scene_to_file("res://menu.tscn")

	
