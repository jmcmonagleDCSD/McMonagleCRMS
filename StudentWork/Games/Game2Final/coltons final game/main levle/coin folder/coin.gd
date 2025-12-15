extends Node2D
var speed = -3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("colected")
		await $AnimatedSprite2D. animation_finished
		queue_free()
