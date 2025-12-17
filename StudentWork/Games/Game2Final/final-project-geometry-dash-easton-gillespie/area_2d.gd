extends Area2D



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://end_of_level.tscn")
	
func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("portal to end")
