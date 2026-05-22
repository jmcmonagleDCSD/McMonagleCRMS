extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

func _ready() -> void:
	print(rotation)

func _process(delta):
	if velocity.x > 3000:
		velocity.x = 3000
	velocity.y += 30

	if Input.is_action_pressed("Forward"):
			velocity.x += 7

	elif  Input.is_action_pressed("stop") and velocity.x > 0:
		velocity.x -= 30
	else:
		velocity.x -= 7
		
	if Input.is_action_pressed("Pop_up"):
		rotate(-0.01)
	else:
		if rotation <= 0.0:
			print(rotation)
			rotate(0.02)
			
			
	if velocity.x < 3:
		velocity.x = 0
	
	play_animate()

	move_and_slide()
	


func play_animate():
	if velocity.x < 3:
		animation.play("Idle")
	if velocity.x > 3:
		animation.play("Moving")
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bikes"):
		return
	await get_tree().physics_frame
	get_tree().change_scene_to_file("res://menu.tscn")
