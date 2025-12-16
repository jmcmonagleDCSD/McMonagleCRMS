extends Node2D
@export var scene: PackedScene




func _on_timer_timeout() -> void:
	var xpos = $Marker2D.position.x
	var ypos = randi_range($Marker2D.position.y, $Marker2D2.position.y)
	var newpos = Vector2(xpos, ypos)
	var pipe = scene.instantiate()
	add_child(pipe)
	pipe.position = newpos
	
