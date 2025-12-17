extends Timer


@export var enemy_scene: PackedScene


func _on_timeout() -> void:
	var random_pos = randi_range($Marker2D.position.x, $Marker2D2.position.x)
	print(random_pos)
