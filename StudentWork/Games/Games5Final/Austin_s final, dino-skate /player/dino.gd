extends CharacterBody2D


var gravity = 20
var jump_height = -750
var direction = 0
var speed = 370
var sliding = false
var jumping = true
var can_be_hurt = true
var health = 5
var fliping = false

@onready var animation = $AnimatedSprite2D

func _process(delta: float) -> void:
	velocity.y += gravity
	if velocity.y > 500:
		velocity.y = 500
	
	if Input.is_action_just_pressed("jump")and is_on_floor():
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
	move_and_slide()
	play_animation()


func bouce(bouce_hight):
	velocity.y = bouce_hight

	


func play_animation():
	if sliding == false and fliping == false:
		
		if is_on_floor():
			if velocity.x == 0:
				animation.play("idle")
			else:
				$AnimatedSprite2D.play("run") 
		else:
			if velocity.y < 0:
				animation.play("jump")
func hurt():
	if can_be_hurt:
		can_be_hurt = false
		health -= 1
		if health == 0:
			await get_tree().create_timer(.1).timeout
			die() 
		can_be_hurt=true
		

func die():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://levels/die.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("dino"):
		sliding = true
		animation.play("get to slide")
		await get_tree().create_timer(0.9).timeout
		animation.play("slide")


func _on_area_2d_body_exited(body: Node2D) -> void:
	sliding = false


func _on_ramp_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("dino"):
		fliping = true
		animation.play("flip")


func _on_ramp_1_body_exited(body: Node2D) -> void:
	fliping = false
