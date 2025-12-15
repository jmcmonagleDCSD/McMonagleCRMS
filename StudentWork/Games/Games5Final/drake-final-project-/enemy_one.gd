extends Area2D

var speed= 3


func _process(delta):
	position.x -= speed


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().paused  = true
