extends Control

var score = 0

func _on_timer_timeout() -> void:
	score += 1
	$Label.text = "score:" + str(score)
	Global.score=score
