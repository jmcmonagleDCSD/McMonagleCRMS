extends Area2D


func _on_body_entered(body: Node2D) -> void:
	respawn()
	
func respawn():
	die()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://level.tscn")

func die():
	get_tree().paused = true
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = false
