extends CharacterBody2D
signal do_wheelie
func _ready() -> void:
	print(rotation)
	
func _process(delta):
	velocity.y += 30
	
	if Input.is_action_pressed("foward"):
		velocity.x = 3500
	elif Input.is_action_pressed("stop"):
		velocity.x = -3500
	if Input.is_action_pressed("wheelie"):
		rotate(-0.05)
		do_wheelie.emit()
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -650


		
		
		
		
		
		
	else:
		if rotation <= 0.0:
			print(rotation)
			rotate(0.02)
			
			
	move_and_slide()
	
func anmimate():
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("surron"):
		return
	await get_tree().physics_frame
	get_tree().change_scene_to_file("res://control.tscn")
	
