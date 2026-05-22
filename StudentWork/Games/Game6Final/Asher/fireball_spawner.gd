extends Node2D

@export var fireball_scene: PackedScene

func _on_timer_timeout(): 
	var random_x_pos = randi_range($Marker2D.position.x, $Marker2D2.position.x)
	var pos = Vector2(random_x_pos,$Marker2D.position.y)
	var enemy = fireball_scene.instantiate() as Node2D                                                                
	add_child(enemy)
	enemy.position = pos 
