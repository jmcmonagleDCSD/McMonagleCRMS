extends Node2D



func _physics_process(delta: float) -> void:
	position.x = -3

func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	pass # Replace with function body.
