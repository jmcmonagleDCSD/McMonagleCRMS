extends Area2D

var speed = -120





func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("character_body_2d"):
		get_tree().paused = true


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("character_body_2d"):
		get_tree().paused = true

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("character_body_2d"):
		body.hurt()
