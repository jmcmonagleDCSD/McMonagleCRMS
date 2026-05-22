extends Control

func _ready() -> void:
	$Label.text = "highscore: " + str(Global.highscore)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"): 
		get_tree().change_scene_to_file("res://level/level_1.tscn")
