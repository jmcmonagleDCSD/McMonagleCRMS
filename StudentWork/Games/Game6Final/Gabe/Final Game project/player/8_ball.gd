extends CharacterBody2D

var Gravity = 30
var Jump = -600
var Speed = 300
var Direction = 0
var health = 8
var can_take_damage = true


func _ready() -> void:
	$health.text = str(health)

func _process(delta: float) -> void:
	velocity.y += Gravity
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = Jump
		
	if Input.is_action_pressed("Right"):
		Direction = 1 
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("Left"):
		Direction = -1
		$AnimatedSprite2D.flip_h = true
	else:
		Direction = 0
		
		
	velocity.x = Direction * Speed
		
	move_and_slide()
	
	Animation()

func Animation():
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("Idle")
		else:
			$AnimatedSprite2D.play("rolling")
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play("falling")
		else:
			$AnimatedSprite2D.play("jumping")
			
func taking_damage():
	if can_take_damage:
		health -= 1
		can_take_damage = false
		if health == 0:
			get_tree().change_scene_to_file("res://Final Game project/level_folder/menu.tscn")
		can_take_damage = true
		$health.text = str(health)
	
	
