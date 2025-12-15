extends Node2D

var speed = 3

func _process(delta):
	position.x -=speed

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("fighterjet"):
		get_tree().change_scene_to_file("res://menu.tscn")
