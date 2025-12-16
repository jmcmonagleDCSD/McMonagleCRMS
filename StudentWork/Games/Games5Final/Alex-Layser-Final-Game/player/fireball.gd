extends RigidBody2D

var speed = 600
var direction = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	linear_velocity.x = speed * direction
	linear_velocity.y = -200


func _on_timer_timeout() -> void:
	queue_free()
