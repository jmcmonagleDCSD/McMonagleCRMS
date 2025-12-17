extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var speed = 1
var direction = Vector2.ZERO






func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	direction = position.direction_to(player.position)
	velocity.x += direction.x *speed
	
	move_and_slide()
	
	if direction.x >0:
		animation. flip_h = true
	if direction.x <0:
		animation. flip_h = false
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.hurt


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hurt()
