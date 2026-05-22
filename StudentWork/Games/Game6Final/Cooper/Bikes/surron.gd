extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var animation2 = $AnimatedSprite2D2

func _ready() -> void:	
	print(rotation)

func _process(delta):
	if velocity.x > 3000:
		velocity.x = 3000
	velocity.y += 30

	if Input.is_action_pressed("Forward"):
			velocity.x += 5

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
		animation.play("idle_red")
	if velocity.x > 3:
		animation.play("Moving_red")
		
	if Input.is_action_pressed("Hand_Drag"):
		animation2.play("Hand_drag")
	elif Input.is_action_pressed("Knee_Nocker"):
		animation2.play("Knee_nocker")
	else:
		animation2.play("Normal")

	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bikes"):
		return
	await get_tree().physics_frame
	get_tree().change_scene_to_file("res://menu.tscn")

func swap_character(new_character_scene: PackedScene):
	# 1. Instantiate the new character
	var new_char = new_character_scene.instantiate()
	
	# 2. Position it at the current character's location
	new_char.global_position = self.global_position
	new_char.rotation = self.rotation
	
	# 3. Add to the scene tree (add before removing)
	get_parent().add_child(new_char)
	
	# 4. Remove the old character
	self.queue_free()
