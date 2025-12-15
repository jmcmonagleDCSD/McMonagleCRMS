extends CharacterBody2D


var gravity = 80
var jump_height = -1100


var direction = 0
var speed = 320

var health = 5
var can_be_hurt = true


func _ready() -> void:
	pass




func _process(delta: float) -> void:
	velocity.y += gravity


	if Input.is_action_just_pressed("jump")and is_on_floor():
		velocity.y = jump_height


	if Input.is_action_pressed("left"):
		direction = -1
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		$AnimatedSprite2D.flip_h = false
	else:
		direction = 0
		
	velocity.x = direction * speed



	move_and_slide()
	play_animation()
	print(can_be_hurt)
	
	
	
func play_animation():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("running")
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play("fall")
		else:
			$AnimatedSprite2D.play("jump")
	
func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
		if health == 0:
			die()
		await get_tree().create_timer(.5).timeout
	
	
	
func die():
	get_tree().paused = true
