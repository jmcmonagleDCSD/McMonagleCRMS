extends Area2D

@export var next_level:PackedScene




func _on_body_entered(body: Node2D) -> void:
		if body.is_in_group("player"):
			$AnimatedSprite.play("wheninteracted")
			get_tree().paused = true 
			await get_tree().create_timer(3).timeout 
			get_tree().change_scene_to_file("res://node_2d.tscn")
