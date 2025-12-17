extends Node2D

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		get_tree().paused = true


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		get_tree().paused = true

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hurt()
