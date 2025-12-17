extends Area2D
@export var next_level : PackedScene




func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().paused = true
		$AnimatedSprite2D.play("default")
		await get_tree().create_timer(3).timeout
		
