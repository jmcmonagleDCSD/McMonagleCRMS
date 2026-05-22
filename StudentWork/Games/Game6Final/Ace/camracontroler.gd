extends Node3D

@export var min_limit_x: float
@export var max_limit_x: float
@export var horizontal_accleration := 2.0
@export var vertical_accleration := 1.0
@export var mouse_accleration := 0.005 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_from_vector(event.relative * 0.005) 
		
func rotate_from_vector(v: Vector2):
			if v. length() == 0: return
			rotation.y += v.x
			rotation.x += v.y
			rotation.x = clamp(rotation.x, min_limit_x, max_limit_x)
