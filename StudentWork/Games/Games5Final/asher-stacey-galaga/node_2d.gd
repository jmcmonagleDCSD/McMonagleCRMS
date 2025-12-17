extends Node2D

var direction=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_child_entered_tree(node: Node) -> void:
	if is_in_group("laser"):
		$AnimatedSprite2D.play("explode")
		await get_tree().create_timer(.4).timeout
		queue_free()
