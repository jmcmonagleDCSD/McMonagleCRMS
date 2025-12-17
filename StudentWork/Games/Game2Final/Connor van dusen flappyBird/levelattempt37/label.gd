extends Label

var Score = 1

func _ready():
	Score = 0
	text = "Score: " + str(Score)
	

func _on_timer_timeout() -> void:
	Score = Score + 1
	text = "Score: " + str(Score)
