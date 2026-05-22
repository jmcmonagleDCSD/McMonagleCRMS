extends Area2D

@export var fake : bool = false

func _on_body_entered(body: Node2D) -> void:
	if not fake:
		if body.is_in_group("player"):
			Global.reset.emit()
			get_tree().paused = true
			await get_tree().create_timer(0.3).timeout
			get_tree().paused = false
			body.velocity.y = 0
			body.position = Vector2(49, 144)
			
