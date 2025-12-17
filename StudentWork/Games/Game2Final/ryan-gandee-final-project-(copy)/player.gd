extends CharacterBody2D

var gravity = 5
var jump_height = -175 

# called when the node enters the scene tree for the first time
func _ready():
	pass # replace with function body.


# called every frame. 'delta' is the elapsed time sice the previous frame.
func _process(delta):
	velocity.y = velocity.y + gravity
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height

	move_and_slide()
	
