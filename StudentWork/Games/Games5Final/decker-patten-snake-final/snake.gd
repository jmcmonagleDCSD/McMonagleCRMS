extends CharacterBody2D


var speed = 150 
var direction = 0
var offset = 8
var max_points = 16
var trail_points: Array[Vector2] = []
var segments: Array = []
var body_segment = preload("res://snake_body.tscn")
var body_group

func _ready() -> void:
	body_group = get_node("BodySegments") as Node


func _process(delta: float) -> void:
	if Input.is_action_pressed("go_up"):
		velocity.y = -speed
		direction = 0
	elif Input. is_action_pressed("down"):
		velocity.y = speed
		direction = 0
		
	if Input.is_action_pressed("left"):
		direction = -1
		velocity.y = 0
	elif Input.is_action_pressed("right"):
		direction = 1
		velocity.y = 0
	velocity.x = direction * speed
	
	move_and_slide()
	trail_points.push_front(global_position)
	if trail_points.size() > max_points:
		trail_points.pop_back()
		
	if body_group.get_children().size() > 0:
		for index in body_group.get_child_count():
			var body = body_group.get_children()[index]
			body.target = get_target_for_segement(index + 1)

func add_segemtent():
	var new_body = body_segment.instantiate()
	new_body.global_position = global_position
	body_group.add_child(new_body)
	max_points = body_group.get_child_count() * offset
	
func get_target_for_segement(index):
	var distance = index * offset
		
	if distance < trail_points.size():
		return trail_points[distance]
	else:
		return trail_points.back()
	
	
func die():
	get_tree().paused = true
