extends CharacterBody2D
var helth=5
var can_be_hurt=true
var speed=175
var direction=0
var x_position
var points
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_be_hurt=false
	await get_tree().create_timer(2).timeout
	can_be_hurt=true
	



func _process(delta: float) -> void:
	points=Global.points
	x_position=global_position.x
	if Input.is_action_pressed("left"):
		direction=-1
		speed=175
	
		
	elif Input.is_action_pressed("right"):
		direction=1
		speed=175
	else:
		speed=0
	
	velocity.x = direction*speed
	if points==20:
		get_tree().change_scene_to_file("res://level_2.tscn")
	move_and_slide()
func hurt():
	if can_be_hurt ==true:
		can_be_hurt=false
		helth-=1
		
		await get_tree().create_timer(.2).timeout
		can_be_hurt=true
	if helth==0:
		get_tree().change_scene_to_file("res://node_2d.tscn")
	
	
