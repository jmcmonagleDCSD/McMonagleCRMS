extends CharacterBody2D

var speed = 200
var direction = Vector2.DOWN
var idle_direction = "down"
var gravity = 100

var hook_pos = Vector2()
var hooked = false
var rope_length = 500
var current_rope_length

func _ready() -> void:
	current_rope_length = rope_length



func _gravity():
	#gravity
	velocity.y += gravity

		

func _physics_process(delta: float) -> void:
	print(position)
	_gravity()
	hook()
	if hooked:
		_gravity()
		swing(delta)
		direction *= 0.975 #swing speed
		direction = move_and_slide()
		
	direction = move_and_slide()
	
func _draw():
	var pos = global_position
	
	if hooked:
		draw_line(Vector2(0,-9), to_local(hook_pos), Color(0.0, 0.0, 0.0, 1.0), 3, true) #hook color
	else:
		return
		
		var colliding = $Raycast.is_colliding()
		var collide_point = $Raycast.get_collision_point()
		if colliding and pos.distance_to(collide_point) < rope_length:
			draw_line(Vector2(0,-9), to_local(collide_point), Color(1,1,1,0.25), 0.5, true) #white
		

func hook():
	$Raycast.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("lmb"):
		hook_pos = get_hook_pos()
		if hook_pos:
			hooked = true
			current_rope_length = global_position.distance_to(hook_pos)
	if Input.is_action_just_released("lmb") and hooked:
		hooked = false

func get_hook_pos():
	for raycast in $Raycast.get_children():
		if raycast.is_colliding():
			return raycast.get_collision_point()

func swing(delta):
	var radius = global_position - hook_pos
	if direction.length() < 0.01 or radius.length() < 10: return
	var angle = acos(radius.dot(direction) / (radius.length() * direction.length()))
	var rad_vel = cos(angle) * direction.length()
	direction += radius.normilized() * -rad_vel
	
	if global_position.distance_to(hook_pos) > current_rope_length:
		global_position = hook_pos + radius.normalized() * current_rope_length
		
	direction += (hook_pos - global_position).normalized() * 15000 *delta

	#Movement
	direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * speed
	move_and_slide()
	set_animation()
	#jump
	if is_on_floor():
		velocity.y += gravity
		if Input.is_action_pressed("move_up"):
			velocity.y = -500
			$AnimatedSprite2D.play("blob_jump")


func set_animation():
#animations
	if direction == 0:
		$AnimatedSprite2D.play("blob_idle")
	if direction != 0:
		if direction > 0:
			$AnimatedSprite2D.play("blob_move")
			$AnimatedSprite2D.scale.x = 1
		elif direction < 0:
			$AnimatedSprite2D.play("blob_move")
			$AnimatedSprite2D.scale.x = -1
			
