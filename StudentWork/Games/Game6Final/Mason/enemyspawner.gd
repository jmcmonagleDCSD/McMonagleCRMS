extends Node2D


# Called when the node enters the scene tree for the first time.
@export var enemy_scene: PackedScene


func _on_timer_timeout() -> void:
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)
	var rand_x_pos = randf_range($Marker2D.position.x,$Marker2D2.position.x)
	new_enemy.position = Vector2(rand_x_pos,$Marker2D.position.y)
