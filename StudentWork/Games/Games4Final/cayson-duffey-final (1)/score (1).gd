extends Label

var score = 0

func _ready() -> void:
	score =0
	print(score)
	text ="Score: " + str(score)


func _on_timer_timeout():
	score = score + 1
	text ="Score: " + str(score)
	
