extends CanvasLayer

var score = 0

func _ready():
	$Label.text = "Score: 0"
	Score.hide()

func _process(delta: float) -> void:
	$Label.text = "Score: " + str(score)
