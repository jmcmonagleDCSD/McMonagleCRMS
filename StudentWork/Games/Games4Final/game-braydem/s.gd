extends Label


var score=0


func _ready() -> void:
	score=0
	print(score)
	text="score: " + str(score)
	


func _on_timer_timeout() -> void:
	score =score + 1
	Global.score = score
	text="score: " + str(score)


	if score > Global.highscore: 
		Global.highscore = score
