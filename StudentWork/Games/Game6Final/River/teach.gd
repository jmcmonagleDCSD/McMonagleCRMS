extends Area2D

func animation(animation_name):
	$AnimatedSprite2D.play(animation_name)
	await get_tree().create_timer(3).timeout
	$AnimatedSprite2D.play("default")

func _on_mouse_entered() -> void:
	animation("pet")
	await get_tree().create_timer(3).timeout


func _on_mouse_exited() -> void:
	animation("default")
