extends Control

func _ready() -> void:
	$TextureRect/score.text = "score                                                                                          " + str(Global.score)
	
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://Level.tscn")
