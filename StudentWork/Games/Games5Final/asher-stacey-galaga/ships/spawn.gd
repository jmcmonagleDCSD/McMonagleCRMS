extends Marker2D


@export var laser:PackedScene = preload("res://items/laser.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var new_laser = laser.instantiate()
		get_tree().get_first_node_in_group("lasers").add_child(new_laser)
		new_laser.global_position = global_position
