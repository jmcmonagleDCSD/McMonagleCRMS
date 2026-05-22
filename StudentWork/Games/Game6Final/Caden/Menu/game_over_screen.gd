extends Control

var can_press_r = false

func _ready() -> void:
	game_over()
	
	

func _process(delta: float) -> void:
	if can_press_r:
		if Input.is_action_just_pressed("start"):
			get_tree().change_scene_to_file("res://Menu/menu.tscn")

func game_over():
	show()
	$Timer.start()

func _on_timer_timeout() -> void:
	$HBoxContainer/VBoxContainer/Restart.show()
	can_press_r = true
