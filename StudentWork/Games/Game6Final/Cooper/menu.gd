extends Control

func _ready() -> void:
	$Label3.text = "highscore: " + str(Global.highscore)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Start game"):
		get_tree().change_scene_to_file("res://Level/level.tscn")
