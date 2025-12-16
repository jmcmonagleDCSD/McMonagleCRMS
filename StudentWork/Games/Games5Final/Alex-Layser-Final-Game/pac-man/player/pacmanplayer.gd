extends CharacterBody2D
var speed = 100
var direction = -90
var vmovedir = -1
var movedir = 0
func _process(delta: float) -> void:
	velocity.y = speed * vmovedir
	velocity.x = speed * movedir
	$AnimatedSprite2D.rotation_degrees = direction
	if Input.is_action_just_pressed("down"):
		direction = 90
		vmovedir = 1
		movedir = 0
	elif Input.is_action_just_pressed("up"):
		direction = -90
		vmovedir = -1
		movedir = 0
	elif Input.is_action_just_pressed("left"):
		direction = 180
		vmovedir = 0
		movedir = -1
	elif Input.is_action_just_pressed("right"):
		direction = 0
		vmovedir = 0
		movedir = 1
		
		
	$AnimatedSprite2D.play("run")
	move_and_slide()
