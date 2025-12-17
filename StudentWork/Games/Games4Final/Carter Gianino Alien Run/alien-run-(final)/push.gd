extends Node2D

func _physics_process(delta: float) -> void:
	position.x += -3


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://game over animation.tscn")
