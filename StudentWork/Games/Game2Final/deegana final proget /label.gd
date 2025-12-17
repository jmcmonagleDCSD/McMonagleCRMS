extends Label

var score=0

func _ready():

	score= 67
	print("score")
	text =  "score: " +str(score)
func _on_timer_timeout():
	score = score+1
	text="score: " +str(score)
	
