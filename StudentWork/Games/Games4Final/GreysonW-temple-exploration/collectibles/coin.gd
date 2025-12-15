extends Node2D




func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AudioStreamPlayer.play()
		$Area2D3/AnimatedSprite2D.play("Collected")
		Score.score += 1
		await $Area2D3/AnimatedSprite2D.animation_finished
		queue_free()
		
