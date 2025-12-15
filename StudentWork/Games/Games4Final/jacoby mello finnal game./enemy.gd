extends CharacterBody2D

@onready var wall_detctor: Area2D = $wall_detctor
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D



var jump_hight = -100
var speed = 50
var gravity = 20
var can_turn = true

func _process(delta: float) -> void:
	if is_on_floor():
		animation.play("jump")
		await get_tree().create_timer(.5).timeout
		animation.play("falling")
		velocity.y = jump_hight
		velocity.x = speed
	velocity.y += gravity
	if wall_detctor.has_overlapping_areas() and can_turn:
		speed = speed * -1
		can_turn = false
		await get_tree().create_timer(.5).timeout
		can_turn = true
	move_and_slide()
