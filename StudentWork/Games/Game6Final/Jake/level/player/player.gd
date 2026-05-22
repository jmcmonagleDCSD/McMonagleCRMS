extends CharacterBody2D

var gravity = 28
var jump = -400

func _process(delta):
	velocity.y += gravity
	if velocity.y > 500:
		velocity.y = 500
		velocity.x = 170
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump
		
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
	
