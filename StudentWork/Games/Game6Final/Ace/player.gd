extends CharacterBody3D



@export var jump_impulse := 12.0
@export var base_speed := 4.0

@onready var camera = $Camracontroler/Camera3D

var movement_input := Vector2.ZERO

var _gravity := -30.0

func _ready():
	print(global_transform.origin)
	
	
func _physics_process(delta: float) -> void:
	movement_input = Input.get_vector("left","right","forward","backward")#.rotated(-camera.global_rotation.y)
	velocity = Vector3(movement_input.x,0,movement_input.y) * base_speed
	var y_velocity := velocity.y
	
	velocity.y = y_velocity + _gravity * delta
	
	move_and_slide()
	
 
