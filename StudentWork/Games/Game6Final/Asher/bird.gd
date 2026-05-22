extends CharacterBody2D

var gravity = 51
var jump_height = -1500
func _process(_delta: float) -> void:
	
	velocity.y += gravity
	if Input.is_action_just_pressed("jump"):
		velocity.y = -1000
	
	move_and_slide()






func _on_static_body_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
