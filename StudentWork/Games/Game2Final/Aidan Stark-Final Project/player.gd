extends CharacterBody2D

var speed = 300
var direction = Vector2.DOWN
var idle_direction = "down"

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $KaelThorne3

func _process(delta):
	velocity.y += 50
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -1000
		
	direction = Input.get_axis("left" , "Right")
	velocity.x = direction * speed
	set_animations()
	move_and_slide()
	
func set_animations():
	if !is_on_floor():
		animation_player.play("Jump")
	if direction != 0:
		if direction > 0:
			animation_player.play("Walk_forward")
			idle_direction = "Right"
		elif direction < 0:
			animation_player.play("Walk_back")
			idle_direction = "Left"
