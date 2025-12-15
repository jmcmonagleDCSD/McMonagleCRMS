extends Node2D

var score = 0
var bank = 0


func _ready() -> void:
	$score.text = str(score)


func _process(delta: float) -> void:
	pass


func _on_timer_score_timeout() -> void:
	score += bank
	$score.text = str(score)
	Score.score = score
