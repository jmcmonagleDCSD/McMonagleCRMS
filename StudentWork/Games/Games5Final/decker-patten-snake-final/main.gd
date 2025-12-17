extends Node2D




func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("snake"):
		get_tree().paused = true


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("snake"):
		get_tree().paused = true

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("snake"):
		get_tree().paused = true
		


func _on_area_2d_4_body_entered(body: Node2D) -> void:
	if body.is_in_group("snake"):
		get_tree().paused = true
