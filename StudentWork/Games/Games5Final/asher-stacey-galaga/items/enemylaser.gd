extends Area2D
@export var enemylaser:PackedScene

var speed=700
func _process(delta: float) -> void:
	position.y+=7


func _on_body_entered(body: Node2D) -> void:
	body.hurt()
