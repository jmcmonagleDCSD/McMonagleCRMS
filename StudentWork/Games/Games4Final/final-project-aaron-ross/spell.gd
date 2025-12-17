extends CharacterBody2D


var speed = 300
var direction = Vector2.RIGHT

func _ready():
	direction = Vector2.RIGHT.rotated(global_rotation)
	
func _process(delta):
	velocity = direction * speed
	move_and_slide()
