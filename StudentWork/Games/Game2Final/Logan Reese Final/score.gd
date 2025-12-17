extends Control

var score = 0


func on_timer_timeout():
	$Label.text = str(score)
	
func _on_timer_timeout() -> void:
	score += 1
	$Label.text = str(score)
