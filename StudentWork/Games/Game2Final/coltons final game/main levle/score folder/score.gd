extends Label


var score = 0

func _ready():
	score= 0
	text ="score: " + str(score)


func _on_timer_timeout() -> void:
	score = score + 1
	text ="score: " + str(score)
