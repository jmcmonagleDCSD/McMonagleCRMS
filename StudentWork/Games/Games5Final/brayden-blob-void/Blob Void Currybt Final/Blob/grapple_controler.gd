extends Node2D

@export var rest_length = 2  # how long grapple is with no force on it
@export var stiffness = 2.5 # how fast the player is pulled in
@export var damping = 2

@onready var ray: RayCast2D = $RayCast2D
@onready var rope: Line2D = $Line2D
@onready var player = get_parent() as CharacterBody2D

var target: Vector2
var launched = false


func _process(delta: float) -> void:
	ray.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("lmb"):
		
		launch()
		
	if Input.is_action_just_released("lmb"):
		retract()
		
	if launched:
		handle_graple(delta)
		
		
func launch():
	if ray.is_colliding():
		launched = true
		target = ray.get_collision_point()
		rope.show()
	
func retract():
	launched = false
	rope.hide()
	
func handle_graple(delta):
	var target_dir = player.global_position.direction_to(target)
	var target_dist = player.global_position.distance_to(target)
	
	var displacement = target_dist - rest_length
	
	var force = Vector2.ZERO
	
	if displacement > 0:
		var spring_force_amount = stiffness * displacement
		var spring_force = target_dir * spring_force_amount
		
		var vel_dot = player.velocity.dot(target_dir)
		var damping = -damping * vel_dot * target_dir
		
		force = spring_force + damping
		
	player.velocity += force 
	update_rope()

func update_rope():
	rope.set_point_position(1, to_local(target))
