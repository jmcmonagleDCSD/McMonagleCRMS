extends Node2D

@export var fruit_scene: PackedScene

var number_of_fruit = 0
var max_fruit = 1
func _on_timer_timeout() -> void:
	print(number_of_fruit)
	if number_of_fruit >= max_fruit:
		return
	var y_pos = randi_range($Marker2D.position.y,$Marker2D2.position.y)
	var x_pos = randi_range($Marker2D.position.x,$Marker2D2.position.x)
	var new_pos = Vector2(x_pos, y_pos)
	
	var fruit = fruit_scene.instantiate()
	add_child(fruit)
	fruit.position = new_pos
	fruit.respawn.connect(on_respawn)
	number_of_fruit += 1
	
	
func on_respawn():
	number_of_fruit -= 1
