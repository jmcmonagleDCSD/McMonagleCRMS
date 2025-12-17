extends Area2D
var points=0
var enemylaser=preload("res://enemylaser.tscn")


var direction=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$Timer.wait_time=randf_range(5,10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_body_entered(body: Node2D) -> void:
	if is_in_group("laser"):
		$AnimatedSprite2D.play("explode")
		await get_tree().create_timer(.4).timeout
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser"):
		$AnimatedSprite2D.play("explode")
		await get_tree().create_timer(.4).timeout
		Global.points+=1
		queue_free()


func _on_timer_timeout() -> void:
	$Timer.wait_time=randf_range(1,2)
	var enemylaser = enemylaser.instantiate()
	get_tree().get_first_node_in_group("enemylaser").add_child(enemylaser)
	enemylaser.global_position = global_position
