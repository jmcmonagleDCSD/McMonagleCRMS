extends CharacterBody2D


var speed = 100
var direction = Vector2.DOWN
var idle_direction = "down"

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

func _process(_delta: float) -> void:
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	velocity = direction * speed
	set_animations()
	move_and_slide()


func set_animations():
	#Walking
	if direction.y != 0:
		if direction.y > 0:
			$AnimationPlayer.play("walk_down")
			idle_direction = "down"
		elif direction.y < 0:
			$AnimationPlayer.play("walk_up")
			idle_direction = "up"
	elif direction.x != 0:
		if direction.x > 0:
			$AnimationPlayer.play("walk_side")
			idle_direction = "side"
			$Sprite2D.scale.x = 3.0
		elif direction.x < 0:
			$AnimationPlayer.play("walk_side")
			idle_direction = "side"
			$Sprite2D.scale.x = -3.0
	#Idle
	else:
		$AnimationPlayer.play("idle_" + idle_direction)
