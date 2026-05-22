extends Node2D
signal scored(score)
var score = 0
	

	


func _on_area_2d_pressed() -> void:
	score = 1
	scored.emit(score)
	
