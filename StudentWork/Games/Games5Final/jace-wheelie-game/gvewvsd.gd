extends RigidBody2D

# Use @onready to assign nodes from the scene tree structure.
# This ensures the target nodes are ready and valid before the variable is accessed.
@onready var rear_wheel: RigidBody2D = $RearWheel
@onready var front_wheel: RigidBody2D = $FrontWheel
@onready var rear_joint: PinJoint2D = $RearJoint
@onready var front_joint: PinJoint2D = $FrontJoint

# Vehicle parameters
var engine_power: float = 5000.0
var max_speed: float = 2000.0

func _ready():
	# Configure the joints here if needed, or in the editor
	rear_joint.node_a = rear_wheel.get_path()
	rear_joint.node_b = get_path() # Connects to the parent Bike node
	front_joint.node_a = front_wheel.get_path()
	front_joint.node_b = get_path()
	pass
func _physics_process(delta):
	# Get player input
	var direction := 0
	if Input.is_action_pressed("ui_right"):
		direction = 1
	if Input.is_action_pressed("ui_left"):
		direction = -1

	# Apply engine force to the rear wheel
	if direction != 0:
		rear_wheel.apply_force(Vector2(direction * engine_power * delta, 0))
	
	# Optional: Apply some angular damping to help stabilize the bike
	# Adjust these values in the Inspector for the Bike and Wheel RigidBodies
	if linear_velocity.length() > max_speed:
		linear_velocity = linear_velocity.normalized() * max_speed
