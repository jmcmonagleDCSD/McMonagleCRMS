extends AnimatedSprite2D





signal hit(taps)

var taps = 0

var hits
func _on_button_pressed():
	hit.emit(taps)
	hits =1
	taps += 1
	frame+=1
	if frame == 13:
		frame=0
		print("you win!!")
		get_tree().change_scene_to_file("res://end.tscn")
