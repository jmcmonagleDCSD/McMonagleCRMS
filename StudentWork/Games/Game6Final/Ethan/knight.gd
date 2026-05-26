extends CharacterBody2D

var speed = 150
var direction = Vector2.DOWN
var idle_direction = "down"
var can_move = true
func _process(_delta):
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if can_move:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	set_animations()
	move_and_slide()
	
	if Input.is_action_just_pressed("s_d"):
		can_move = false
		await get_tree().create_timer(.5).timeout
		can_move = true
	if Input.is_action_just_pressed("s_u"):
		can_move = false
		await get_tree().create_timer(.5).timeout
		can_move = true
	if Input.is_action_just_pressed("s_l"):
		can_move = false
		await get_tree().create_timer(.5).timeout
		can_move = true
	if Input.is_action_just_pressed("s_r"):
		can_move = false
		await get_tree().create_timer(.5).timeout
		can_move = true

func set_animations():
		if direction.y != 0:
			if direction.y > 0:
				$AnimationPlayer.play("walk-down")
				idle_direction = "down"
			elif direction.y < 0:
				$AnimationPlayer.play("walk-up")
				idle_direction = "up"
		elif direction.x != 0:
			if direction.x > 0:
				$AnimationPlayer.play("walk-side")
				idle_direction = "side"
				$Sprite2D.scale.x = 1
			elif direction.x < 0:
				$AnimationPlayer.play("walk-side")
				idle_direction = "side"
				$Sprite2D.scale.x = -1
		else:
			$AnimationPlayer.play("idle-" + idle_direction)
