extends CharacterBody3D

@onready var nav = $NavigationAgent3D
var speed = 3.5
var gravity = 9.8



@onready var progress = $"../../CanvasLayer/ProgressBar"
@onready var timer =$"../../Timer"

func _ready() -> void:
	print(global_transform.origin)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta 
	else:
		velocity.y -= 2
	var next_location = nav.get_next_path_position()
	var current_location = global_transform.origin
	var new_velocity = (next_location - current_location).normalized() * speed
	
	
	velocity = velocity.move_toward(new_velocity,0.25)
	move_and_slide()
	
func  target_position(target):
	nav.target_position = target


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		timer.start()


func _on_timer_timeout():
	progress.value-=20
