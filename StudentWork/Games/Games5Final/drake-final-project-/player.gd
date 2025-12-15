extends CharacterBody2D

var speed= 500
var gravity= 30
var jump= -700




func _process(delta: float) -> void:
	velocity.y +=gravity
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
	if is_on_floor():
		$AnimatedSprite2D.play("run")
	
	move_and_slide()
