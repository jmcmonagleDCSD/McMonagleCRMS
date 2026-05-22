extends Node2D

var score = 0
var mod = 1


func _on_banana_scored(Banana: Variant) -> void:
	score += Banana* mod
	$Label.text = str(score)
	if score >10000000:
		get_tree().change_scene_to_file("res://menu.tscn")
		
	
		
	


func _on_banana_red_scored(_Banana: Variant) -> void:
	mod += 2
func _on_banana_blue_scored(_banana: Variant) -> void:
	mod += 4
func _on_banana_green_scored(_banana: Variant) -> void:
	mod += 6
	


func _on_banana_pink_scored(_banana: Variant) -> void:
	mod += 8
