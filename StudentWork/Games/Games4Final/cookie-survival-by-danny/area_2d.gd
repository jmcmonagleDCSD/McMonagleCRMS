extends Area2D

@onready var animation = $AnimatedSprite2D
var speed = 1
var direction = Vector2.ZERO






func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	direction = position.direction_to(player.position)
	position.x += direction.x *speed
	
	
	
	if direction.x >0:
		animation. flip_h = true
	if direction.x <0:
		animation. flip_h = false
