extends Area2D

@export var next_level: PackedScene



func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().paused = true
		$AnimatedSprite2D.play("Win")
		await get_tree().create_timer(2).timeout
		get_tree().paused = false
		get_tree().change_scene_to_packed(next_level)
		
