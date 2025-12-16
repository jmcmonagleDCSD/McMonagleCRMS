extends CharacterBody2D
var speed = 100
var direction = -90
var vmovedir = -1
var movedir = 0
var rd = 1
func _ready() -> void:
	random()
func _process(delta: float) -> void:
	velocity.y = vmovedir * speed
	velocity.x = movedir * speed
	if rd == 1:
		direction = -90
		vmovedir = -1
		movedir = 0
	elif rd == 2:
		direction = 90
		vmovedir = 1
		movedir = 0
	elif rd == 3:
		direction = 0
		movedir = 1
		vmovedir = 0
	else:
		direction = 180
		movedir = -1
		vmovedir = 0
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
func random():
	rd = randi_range(1, 4)
	await get_tree().create_timer(2.5).timeout
	random()
