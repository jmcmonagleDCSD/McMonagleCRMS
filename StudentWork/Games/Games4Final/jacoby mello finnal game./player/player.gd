extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"."
@onready var label_2: Label = $Label2


var speed = 250
var gravity = 10
var jump_height = -325
var direction = 0
var is_on_rail = false



func _process(delta): 
	velocity.y += gravity
	if velocity.y > 480:
		velocity.y = 480
	if Input.is_action_pressed("tail") and Input.is_action_pressed("head") and is_on_floor():
		animation.play("jump")
		await get_tree().create_timer(.5).timeout
		velocity.y = jump_height
	if Input.is_action_pressed("tail") and Input.is_action_pressed("head") and is_on_rail:
		animation.play("jump")
		await get_tree().create_timer(.5).timeout
		velocity.y = jump_height
		if is_on_floor():
			animation.play("move")
	if Input.is_action_pressed("tail") and Input.is_action_pressed("Right") and is_on_floor():
		animation.play("kick_flip")
		await get_tree().create_timer(.5).timeout
		velocity.y = jump_height + 25

	
	velocity.x = speed
	
	if $rotate_forward.has_overlapping_bodies():
		global_rotation_degrees -= 2.5
	if $rotate_backwards.has_overlapping_bodies():
		global_rotation_degrees += 2.5
	if $slant_detector.has_overlapping_bodies():
		velocity.y = -10
	if $wall_detector.has_overlapping_bodies():
		get_tree().change_scene_to_file("res://end_scren.tscn")
	if $rail_detecor.has_overlapping_bodies() and Input.is_action_pressed("Left"):
		velocity.y = 0 
		velocity.x += 0.5
		is_on_rail = true
		animation.play("grind")
	if $fall_detector.has_overlapping_areas():
		get_tree().change_scene_to_file("res://end_scren.tscn")
	
	if speed == 0:
		get_tree().change_scene_to_file("res://end_scren.tscn")
		
	if speed > 250:
		speed += 25
	move_and_slide()
	



func _on_enemy_detector_body_entered(body: Node2D) -> void:
	speed = speed - (speed / 4)
	




func _on_floor_detector_body_entered(body: Node2D) -> void:
	animation.play("move")
