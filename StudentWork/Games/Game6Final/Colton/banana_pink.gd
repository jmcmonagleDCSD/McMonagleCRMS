extends Node2D

signal scored(score)
var score = 0
	

	


func _on_area_2d_pressed() -> void:
	score += 8
	scored.emit(score)


func _on_button_pressed() -> void:
	score += 8
	scored.emit(score)
