extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pacmanp"):
		Global.add_score()
		queue_free()
func _process(delta: float) -> void:
	if Global.score == 2940:
		get_tree().change_scene_to_file("res://pac-man/ui/pacmanwin.tscn")
