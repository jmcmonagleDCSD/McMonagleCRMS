extends Control

var score = 0

func _on_surron_do_wheelie() -> void:
	score += 10
	$Label.text = "score: " + str(score)
	Global.score=score
