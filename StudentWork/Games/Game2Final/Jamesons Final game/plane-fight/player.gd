extends CharacterBody2D
var Bullet_scene = preload("res://bullet.tscn")
var can_shoot = true
var gravity = 3
var direction = Vector2.ZERO
func _process(delta: float) -> void:
	velocity.x += gravity
	
	
	if Input.is_action_pressed("roll left"):
		rotation -= 0.06
		direction = Vector2(cos(rotation),sin(rotation))
	velocity = direction * 125

	move_and_slide()

	if Input.is_action_just_pressed("shoot"):
		var Bullet = Bullet_scene.instantiate()
		get_parent().add_child(Bullet)
		Bullet.position = position
