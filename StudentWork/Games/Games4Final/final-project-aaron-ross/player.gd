extends CharacterBody2D

var speed = 100
var direction = Vector2.DOWN
var idle_direction = "down"

@onready var animated_sprite_2d:  = $AnimatedSprite2D
@onready var bow: = $Bow


func _process(delta):
#update derection and velocity
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	velocity = direction * speed
	set_animations()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		bow.shoot()
		
	move_and_slide()

func set_animations():

	if direction.y != 0:
		if direction.y > 0:
			$AnimatedSprite2D.play("walk_down_1")
			idle_direction = "down"
		elif direction.x < 0:
			$AnimatedSprite2D.play("walk_up")
			idle_direction = "up"
	elif direction.x != 0:
		if direction.x > 0:
			#$AnimatedSprite2D.play("walk_side")
			#idle_direction = "side"
			$AnimatedSprite2D.scale.x = -0.7
	if direction.x < 0:
		$AnimatedSprite2D.scale.x = 0.7
		#$AnimatedSprite2D.play("walk_side")
		#idle_direction = "side"

	else:
		$AnimatedSprite2D.play("idle_" + idle_direction)
