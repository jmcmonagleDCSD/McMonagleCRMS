extends CharacterBody2D

var gravity = 30
var jump_height = 1200


func _process(delta):
	velocity.y += gravity

	move_and_slide()
