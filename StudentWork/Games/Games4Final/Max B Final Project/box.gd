extends Node2D




func _on_timer_timeout() -> void:
	await get_tree().create_timer(1).timeout
	$AnimatedSprite2D.visible = false



func _on_area_2d_area_entered(area: Area2D) -> void:
	Score.score_number += 1
	Score.update_score()
