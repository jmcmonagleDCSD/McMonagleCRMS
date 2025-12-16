extends CharacterBody2D
var speed = 30
var vmovedir = -1
var movedir = 0
var rd = 1
func _ready() -> void:
	random()
func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("pacmanp")
	var direction = position.direction_to(player.position).normalized()
	velocity.y = direction.y * speed * rd
	velocity.x = direction.x * speed * rd
	animate()
	move_and_slide()
func animate():
	if velocity.x > 0 and velocity.y > 0:
		$AnimatedSprite2D.play("downright")
	elif velocity.x < 0 and velocity.y > 0:
		$AnimatedSprite2D.play("downleft")
	elif velocity.x > 0 and velocity.y < 0:
		$AnimatedSprite2D.play("upright")
	elif velocity.x < 0 and velocity.y < 0:
		$AnimatedSprite2D.play("upleft")
	elif velocity.x > 0 and position.y == position.y:
		$AnimatedSprite2D.play("right")
	elif velocity.x < 0 and position.y == position.y:
		$AnimatedSprite2D.play("left")
	elif position.x == position.x and velocity.y < 0:
		$AnimatedSprite2D.play("up")
	elif position.x == position.x and velocity.y > 0:
		$AnimatedSprite2D.play("down")
func die():
	get_tree().change_scene_to_file("res://pac-man/ui/pacmanmenu.tscn")




func random():
	rd = randi_range(1, 4)
	await get_tree().create_timer(2.5).timeout
	random()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pacmanp"):
		die()
		Global.score = 0
