extends CharacterBody2D

var speed = 500
var direction = Vector2.RIGHT

func _ready():
	direction = Vector2.RIGHT.rotated(global_rotation)

func _process(_delta):
	velocity = direction * speed
	move_and_slide()
