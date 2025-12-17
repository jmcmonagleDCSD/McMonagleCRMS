extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Use @onready to get references to nodes when the scene is ready.
# Ensure these node paths match your scene hierarchy exactly.
@onready var rear_wheel: RigidBody2D = $RearWheel
@onready var front_wheel: RigidBody2D = $FrontWheel
@onready var rear_joint: PinJoint2D = $RearJoint
@onready var front_joint: PinJoint2D = $FrontJoint

# Vehicle parameters
const ENGINE_POWER = 15000
const BRAKE_POWER = 1000

func _physics_process(delta: float) -> void:
	# Apply engine force to the rear wheel
	if Input.is_action_pressed("ui_right"):
		# Apply torque to move forward
		rear_wheel.apply_torque(ENGINE_POWER * delta)
	elif Input.is_action_pressed("ui_left"):
		# Apply torque to move backward (or brake in reverse)
		rear_wheel.apply_torque(-ENGINE_POWER * delta)

	# Apply braking force (e.g., space bar)
	if Input.is_action_pressed("ui_accept"): # Default is Space
		rear_wheel.apply_torque(-rear_wheel.angular_velocity * BRAKE_POWER * delta)
		front_wheel.apply_torque(-front_wheel.angular_velocity * BRAKE_POWER * delta)

	# Optional: Add code to detect wheelie condition
	detect_wheelie()

func detect_wheelie() -> void:
	# Get the bike body's rotation in degrees (assuming horizontal start is 0 degrees)
	var bike_angle = rad_to_deg(rotation)
	# Normalize angle to -180 to 180 range
	bike_angle = wrapf(bike_angle, -180, 180)

	if abs(bike_angle) > 30: # If angle is greater than 30 degrees
		# Add game logic here (e.g., increment score, game over)
		pass # Replace with actual game logic
