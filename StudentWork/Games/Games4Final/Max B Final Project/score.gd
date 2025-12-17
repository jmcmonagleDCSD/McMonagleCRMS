extends CanvasLayer

var score_number = 0

func update_score():
	$Label.text = "Score "+str(score_number)+"/6"
