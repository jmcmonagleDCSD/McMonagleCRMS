extends CharacterBody2D
var speed = 80
var direction = -90
var vmovedir = -1
var movedir = 0
func _process(delta: float) -> void:
	velocity.y = speed * vmovedir
	velocity.x = speed * movedir
	if Input.is_action_just_pressed("down"):
		direction = 90
		vmovedir = 1
		movedir = 0
	elif Input.is_action_just_pressed("up"):
		direction = -90
		vmovedir = -1
		movedir = 0
	elif Input.is_action_just_pressed("left"):
		direction = 180
		vmovedir = 0
		movedir = -1
	elif Input.is_action_just_pressed("right"):
		direction = 0
		vmovedir = 0
		movedir = 1
		
	animate()
	move_and_slide()
func animate():
	if direction == 90:
		$AnimatedSprite2D.play("down")
	elif direction == -90:
		$AnimatedSprite2D.play("up")
	elif direction == 0:
		$AnimatedSprite2D.play("right")
	else:
		$AnimatedSprite2D.play("left")
func die():
	get_tree().change_scene_to_file("res://pac-man/ui/pacmanmenu.tscn")
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pacmanp"):
		die()
		Global.score = 0
