extends Node2D


var playerOne_done = false
var playerTwo_done = false



func _on_door_body_entered(body: Node2D) -> void:
	playerOne_done = true



func _on_area_2d_body_entered(body: Node2D) -> void:
	playerTwo_done = true
	
func _process(delta: float) -> void:
	if playerOne_done == true:
		if playerTwo_done == true:
			get_tree().change_scene_to_file("res://level_three.tscn")
