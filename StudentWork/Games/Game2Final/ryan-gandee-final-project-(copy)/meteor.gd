extends Area2D

var speed = 4.5

# Called every frame. 'delta' is the elapsed time since the previous frame
@warning_ignore("unused_parameter")
func _process(delta):
	position.x -= speed


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://main menu.tscn")



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
