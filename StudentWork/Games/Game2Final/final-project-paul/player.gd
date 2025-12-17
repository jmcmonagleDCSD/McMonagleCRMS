extends CharacterBody2D

var gravity :=2400
var flap_force := -800

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta

	if Input.is_action_just_pressed("fly"):
		velocity.y= flap_force
	move_and_slide()
