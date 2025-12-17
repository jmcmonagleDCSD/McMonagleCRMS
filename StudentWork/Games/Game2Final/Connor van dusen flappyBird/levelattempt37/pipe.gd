extends Area2D

var pause = true


func _process(delta: float) -> void:
	position.x -= 4


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("character_body_2d"):
		get_tree().paused
	
