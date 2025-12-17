extends Label


var hits = 0

func _on_button_pressed():
	if hits +0:
		hits += 1


func _on_rock_hit(taps) -> void:
	text = "Strikes: "+str(taps)
