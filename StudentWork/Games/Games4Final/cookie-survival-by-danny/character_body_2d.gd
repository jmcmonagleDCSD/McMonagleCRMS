extends CharacterBody2D
@export var fireball_scene: PackedScene
@onready var animation = $AnimatedSprite2D
var gravity = 30
var jump_hight = -800
var direction = 0
var speed = 300
var can_be_hurt = true
var health = 5
var can_shoot = true
func _process(delta: float) -> void:
	velocity .y += gravity
	
	if Input.is_action_just_pressed("jump")and is_on_floor():
		velocity.y = jump_hight
		
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0	
	
	velocity.x = direction * speed
	
	move_and_slide()
	
	shoot_fireball()
	play_animations()
	print(can_be_hurt)
func shoot_fireball():
	if can_shoot:
		if Input.is_action_just_pressed("shoot"):
			var fireball = fireball_scene.instantiate()
			get_parent().add_child(fireball)
			fireball.position = position
			can_shoot = false
			await get_tree().create_timer(1).timeout
			can_shoot = true
func play_animations():
	if can_be_hurt:
		if is_on_floor():
			if velocity.x == 0:
				animation.play("idol")
			else:
				animation.play("runing")
		else: 
			if velocity.y > 0:
				animation.play("falling")
			else:
				animation.play("jumping")
	else:
		animation.play("hurt")

func hurt():
	if can_be_hurt:
		health -= 1
		if health == 0:
			die()
		await get_tree().create_timer(.5).timeout
func die():
	get_tree().paused = true
