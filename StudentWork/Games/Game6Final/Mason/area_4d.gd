extends Area2D


var speed = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += -speed
	$AnimatedSprite2D.play("default")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
			get_tree().change_scene_to_file("res://color_rect.5tscn.tscn")
