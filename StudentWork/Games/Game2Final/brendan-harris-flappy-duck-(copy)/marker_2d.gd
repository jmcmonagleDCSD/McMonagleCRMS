extends Marker2D
@export var enemy_scene: PackedScene 

func _on_timer_timeout() -> void:
	var y_pos = $Marker2D.position.y  
	var x_pos = randi_range($Marker2D.position.x, $Marker2D2.position.x)
	var _new_pos = Vector2(x_pos, y_pos) 
	var pipe = enemy_scene.instantiate()
	add_child(pipe)
