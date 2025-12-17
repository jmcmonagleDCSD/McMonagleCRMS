extends Node2D

@export var enemy_scene: PackedScene


func _on_timer_timeout() -> void:
	var random_X_pos = randi_range($Marker2D.position.x, $Marker2D2.position.x)
	var enemy = enemy_scene.instantiate() as Node2D
	var pos = Vector2(random_X_pos,$Marker2D.position.y)
	add_child(enemy)
	enemy.position = pos
