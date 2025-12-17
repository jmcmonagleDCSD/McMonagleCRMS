extends CharacterBody2D


const SPEED = 160

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	velocity.y += 20
	
	if Input.is_action_pressed("fly"):
		velocity.y = -100
		
	move_and_slide()


func _physics_process(delta: float) -> void:
	
	velocity.x = SPEED
