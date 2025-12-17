extends Area2D
var speed=7
func _process(delta: float) -> void:
	position.y-=speed





func _on_area_entered(area: Area2D) -> void:
	queue_free()
