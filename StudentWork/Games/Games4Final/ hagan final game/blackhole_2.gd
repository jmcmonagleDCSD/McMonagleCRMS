extends Area2D
var activate2 = false

@export var next_level2: PackedScene


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player2"):
		activate2 = true
		get_tree().change_scene_to_packed(next_level2)       
