extends Area2D

var speed= 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().pause = true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
