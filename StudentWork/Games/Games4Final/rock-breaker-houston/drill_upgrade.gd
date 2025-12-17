extends AnimatedSprite2D



signal hit(taps)

var taps = 0

var hits
func _on_button_pressed():
	hit.emit(taps)
