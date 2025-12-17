extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# --- Script for the main 'Bike' RigidBody2D (Attach to Bike Node) ---


# Export variables to adjust in the Inspector
@export var thrust_power: float = 500.0 # Force to push bike forward
@export var lean_power: float = 10.0   # How much to lean back/forward

# Get nodes (ensure names match your scene!)
@onready var rear_wheel = $RearWheel # Ensure 'RearWheel' is a RigidBody2D child
@onready var front_wheel = $FrontWheel # Ensure 'FrontWheel' is a RigidBody2D child

# This runs every physics frame, good for force application
func _integrate_forces(state: PhysicsDirectBodyState2D):
	# --- Input Handling ---
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var thrust_direction = Vector2.RIGHT.rotated(rotation) # Facing current direction

	# --- Apply Thrust ---
	if Input.is_action_pressed("move_up"): # Use 'move_up' for throttle/thrust
		# Apply force to the bike body itself
		state.apply_central_force(thrust_direction * thrust_power)

	# --- Lean Control ---
	if Input.is_action_pressed("move_right"): # Lean back for wheelie
		# Apply torque to the main body to lean back (adjust sign as needed)
		state.apply_torque_impulse(-lean_power)
	if Input.is_action_pressed("move_left"): # Lean forward to set down
		# Apply torque to lean forward
		state.apply_torque_impulse(lean_power)

# --- Script for 'RearWheel' RigidBody2D (Attach to RearWheel Node) ---


# The 'FrontWheel' should also be a RigidBody2D but receive NO direct torque,
# relying on physics joints and the main body's movement.

# Use _integrate_forces for precise physics control

	# No direct torque/force applied here for a basic wheelie,
	# it reacts to the Bike's forces and its connection (e.g., PinJoint2D)

	# If you want simple rotation based on speed:
	# var angular_velocity = state.angular_velocity # Get current rotation speed
	# state.angular_velocity = global_transform.x.dot(state.linear_velocity) * 2 # Basic rotation
	pass # No torque needed for wheelie lift, physics handles it
