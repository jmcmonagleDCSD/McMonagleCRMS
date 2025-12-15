extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on__1_pressed() -> void:
	if Score.score >= 1:
		Score.bank += 1
	


func _on__20_pressed() -> void:
	if Score.score >= 20:
		Score.bank += 20


func _on__1000_pressed() -> void:
	if Score.score >= 1000:
		Score.bank += 1000

func _on__10000_pressed() -> void:
	if Score.score >= 10000:
		Score.bank += 10000


func _on__1m_pressed() -> void:
	if Score.score >= 1000000:
		Score.bank += 1000000


func _on__250m_pressed() -> void:
	if Score.score >= 250000000:
		Score.bank +=  250000000


func _on__1b_pressed() -> void:
	if Score.score >= 1000000000:
		Score.bank += 1000000000


func _on__175b_pressed() -> void:
	if Score.score >= 175000000000:
		Score.bank += 175000000000


func _on__10t_pressed() -> void:
	if Score.score >= 10000000000000:
		Score.bank += 10000000000000


func _on__1q_pressed() -> void:
	if Score.score >= 100000000000:
		Score.bank += 100000000000


func _on__200q_pressed() -> void:
	if Score.score >= 200000000000000000:
		Score.bank += 200000000000000000


func _on__1Q_pressed() -> void:
	if Score.score >= 1000000000000000000:
		Score.bank += 1000000000000000000
