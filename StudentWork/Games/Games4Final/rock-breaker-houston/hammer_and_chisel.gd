extends AnimatedSprite2D
func _process(_delta: float) -> void:
	var mouse = get_global_mouse_position()
	position = mouse
	
	
