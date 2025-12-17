extends Label

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	print(score)
	text ="Score: " + str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	score = score + 1
	Global.score = score
	text ="Score: " + str(score)
	if score > Global.highscore:
		Global.highscore = score
