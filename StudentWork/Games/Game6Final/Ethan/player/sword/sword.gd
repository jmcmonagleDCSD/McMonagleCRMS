extends Node2D

@onready var sword: Node2D = $"."
@onready var slash: CharacterBody2D = $slash
@onready var node_2d: Node2D = $"../Node2D"

@export var slash_scene: PackedScene = preload("res://player/sword/slash.tscn")

var can_attack = true

func _process(delta):
	
	if  Input.is_action_just_pressed("s_d"):
		sword.swing_down()
	
	if  Input.is_action_just_pressed("s_u"):
		sword.swing_up()
	
	if  Input.is_action_just_pressed("s_l"):
		sword.swing_left()
	
	if  Input.is_action_just_pressed("s_r"):
		sword.swing_right()

func swing_down():
	if can_attack == true:
		var can_attack = false
		var slash = slash_scene.instantiate()
		add_child(slash)
		slash.global_position = sword.global_position
		slash.global_rotation = (900)
		await get_tree().create_timer(.2).timeout
		slash.queue_free()
		await get_tree().create_timer(5.0).timeout
		can_attack = true

func swing_up():
	if can_attack == true:
		var can_attack = false
		var slash = slash_scene.instantiate()
		add_child(slash)
		slash.global_position = sword.global_position
		slash.global_rotation = (2700)
		await get_tree().create_timer(.2).timeout
		slash.queue_free()
		await get_tree().create_timer(5.0).timeout
		can_attack = true
		
func swing_left():
	if can_attack == true:
		var can_attack = false
		var slash = slash_scene.instantiate()
		add_child(slash)
		slash.global_position = sword.global_position
		slash.global_rotation = (1800)
		await get_tree().create_timer(.2).timeout
		slash.queue_free()
		await get_tree().create_timer(5.0).timeout
		can_attack = true
		
func swing_right():
	if can_attack == true:
		var can_attack = false
		var slash = slash_scene.instantiate()
		add_child(slash)
		slash.global_position = sword.global_position
		slash.global_rotation = (0)
		await get_tree().create_timer(.2).timeout
		slash.queue_free()
		await get_tree().create_timer(5.0).timeout
		can_attack = true
