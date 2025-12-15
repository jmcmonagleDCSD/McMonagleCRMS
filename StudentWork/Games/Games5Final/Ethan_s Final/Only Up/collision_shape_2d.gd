extends CollisionShape2D

var gravity = 80
var jump_height = -900




func _ready() -> void:




func _process(delta: float) -> void:
	velocity.y += gravity
	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	move_and_slide()
