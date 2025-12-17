extends Control
@onready var button: Button = $Button
func _process(delta: float) -> void:
	if button.button_pressed:
		get_tree().change_scene_to_file("res://macha.tscn")
