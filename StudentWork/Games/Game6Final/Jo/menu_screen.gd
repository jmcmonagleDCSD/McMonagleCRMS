extends Control

var can_press_space = false

func _ready() -> void:
	game_over()
	$MarginContainer
	set_high_score()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		get_tree().change_scene_to_file("res://control.tscn")
func game_over():
	show()
	$Timer.start()

func _on_timer_timeout() -> void:
	$MarginContainer/Title/Start
	can_press_space = true
	
	
func set_high_score():
	print(Gobal.highscore)
	if Gobal.score > Gobal.highscore:
		Gobal.highscore = Gobal.score
	$"Highscore_#".text = str(Gobal.highscore)
