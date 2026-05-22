extends CharacterBody2D

var gravity = 30
var jump_height = -675
var direction = 0
var speed = 300

var coin_counter = 0

var health = 10
var can_be_hurt = true

@onready var animation = $AnimatedSprite2D

@onready var coin_label = %Label7

func _process(delta: float) -> void:
	velocity.y += gravity

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		animation.flip_h = false
	else:
		direction = 0
	velocity.x = direction * speed
	
	play_animations()

	
	move_and_slide()

func play_animations():
	if can_be_hurt: 
		if is_on_floor():
			if velocity.x == 0:
				animation.play("idle")
			else: 
				animation.play("run")
		else:
			if velocity.y > 0:
				animation.play("fall")
			else:
				animation.play("jump")

func bounce(bounce_height):
	velocity.y = bounce_height

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		set_coin(coin_counter +1)


func set_coin(new_coin_count: int):
	coin_counter = new_coin_count
	coin_label.text = "Coin Count: " + str(coin_counter) 

func hurt():
	if can_be_hurt: 
		health -= 1
		can_be_hurt = false
		if health == 0:
			await get_tree().create_timer(.05).timeout
			die()
		await get_tree().create_timer(.4).timeout
		can_be_hurt = true

	
func die():
	get_tree().paused = true


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print('hurt')
		hurt()
