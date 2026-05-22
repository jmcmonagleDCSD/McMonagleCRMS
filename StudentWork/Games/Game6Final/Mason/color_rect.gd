extends ColorRect

@onready var policecar=$Area2D

@onready var police=$Area2D2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	policecar.position.x += 11
	police.position.x += 10
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_tree().change_scene_to_file("res://level/color_rect.tscn")
