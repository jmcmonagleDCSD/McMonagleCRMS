extends Label
var score = 0




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("safepipescore"):
		score += 1
		text = "%04d" % score
