extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.unlockdoublejump()
		$AnimatedSprite2D.play("bounce orb")
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.play("idle")
