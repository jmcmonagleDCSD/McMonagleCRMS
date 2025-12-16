extends Node2D
var move = -3


func _process(delta: float) -> void:
	position.x += move
	
	

	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://flappybird/ui/flappymenu.tscn")
