extends Area2D
signal pick_up(amount)
var pinapple = 0

func _on_body_entered(body: Node2D) -> void:
		if body.is_in_group("dino"):
			await get_tree().create_timer(0.7).timeout
			pinapple += 1
			pick_up.emit(pinapple)
			queue_free()
