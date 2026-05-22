extends Control




func _ready() -> void:
	$Label2.text = "highscore: "

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right"):
		get_tree().change_scene_to_file("res://pokemon runner/level.tscn")
