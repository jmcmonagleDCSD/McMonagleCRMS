extends CharacterBody2D
var G = 6
var direction = 0
var speed = 200
var health = 3
var can_be_hurt = true
var can_shoot = true
var vertdirection = 1
@onready var anim = $AnimatedSprite2D
func _process(delta: float) -> void:

	
	if Input.is_action_pressed("up"):
		vertdirection = -1
		
	elif Input.is_action_pressed("down"):
		vertdirection = 1
		
	else:
		vertdirection = 0
		
			
			
		
	
	
	if Input.is_action_pressed("left"):
		direction = -1
		anim.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		anim.flip_h = false
	else:
		direction = 0
		
		
		
	velocity.x = direction * speed
	velocity.y = vertdirection * speed
		
	
	
	
	move_and_slide()

	
	play_animations()



func play_animations():
	if velocity.x == 0 and velocity.y == 0:
		anim.play("idle")
	else:
		anim.play("run")
	
	
	
		
		

	
func hurt():
	if can_be_hurt:
		health -= 1
		can_be_hurt = false
		if health == 0:
			await get_tree().create_timer(0.0001).timeout
			die()
		await get_tree().create_timer(0.4).timeout
		can_be_hurt = true
	
func die():
	get_tree().change_scene_to_file("res://UI & Menus/mainmenu.tscn")
	health = 3
