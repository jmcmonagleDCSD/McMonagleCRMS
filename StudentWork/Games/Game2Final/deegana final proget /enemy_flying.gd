extends Node2D


func _process(delta):
	position.x-=3

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().paused=true
