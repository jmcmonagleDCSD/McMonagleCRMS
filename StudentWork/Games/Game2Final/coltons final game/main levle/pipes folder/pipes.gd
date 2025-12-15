extends CharacterBody2D
var speed =-200

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().paused=true
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	velocity.x = speed
	move_and_slide()
