extends Area2D

var speed =0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	speed = 5
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://color_rect6.tscn")
	
