extends CharacterBody2D
var speed = 100
var vmovedir = -1
var movedir = 0
func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("pacmanp")
	var direction = position.direction_to(player.position).normalized()
	velocity.y = direction.y * speed
	velocity.x = direction.x * speed
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



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pacmanp"):
		die()
		Global.score = 0
