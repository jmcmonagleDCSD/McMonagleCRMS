extends CharacterBody2D            
 

@onready var animation = $"NewPiskel(1)1_png(2)"

var shoot = -100

func _process(delta: float) -> void:
	velocity.x -= 3
	velocity.y  += 5
	if velocity.x <= 10:
		velocity.x = 0
	if Input.is_action_just_pressed("shoot"):
		velocity.y = shoot
		velocity.x = -shoot
		
	move_and_slide()
