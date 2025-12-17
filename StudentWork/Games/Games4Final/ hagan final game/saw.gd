extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("saw_player"):
		get_tree().paused= true
