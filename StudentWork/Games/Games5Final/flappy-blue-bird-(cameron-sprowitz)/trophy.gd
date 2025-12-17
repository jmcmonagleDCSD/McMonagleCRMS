extends Area2D


@export var home = PackedScene


func _on_body_entered(body):
	if body.is_in_group("bird"):
		get_tree().passed = true
		$AnimatedSprite2D.play("win")
		await get_tree().create_timer(0).timout
		get_tree().paused = false 
		get_tree().change_scene_to_packed(home)
