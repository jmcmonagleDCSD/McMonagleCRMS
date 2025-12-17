extends CharacterBody2D
var jump_height = -320
var gravity = 6





func _process(delta):
	velocity.y += gravity
	

	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height 
		 
	move_and_slide()
	
	if Input.is_action_just_pressed("move right"):
		velocity.x += 300
	if Input.is_action_just_pressed("move left"):
		velocity.x -= 300






func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("pipes"):
		get_tree().change_scene_to_file("res://Main.tscn")
