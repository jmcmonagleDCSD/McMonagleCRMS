extends CharacterBody2D

var roaming = true
var x_direction = 1
var y_direction = 1
var speed = 50
var player
var direction = Vector2.DOWN
var idle_direction = "down"
 
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

func _process(delta: float) -> void:
	velocity = Vector2(x_direction, y_direction) * speed
	if not roaming:
		speed = 110
		var new_direction = global_position.direction_to(player.global_position)
		x_direction = new_direction.x
		y_direction = new_direction.y
	set_animations()
	move_and_slide()

func set_animations():
	if abs(direction.y) > abs(direction.x):
		if direction.y > 0:
			$AnimationPlayer.play("walk_down")
			idle_direction = "down"
		elif direction.y < 0:
			$AnimationPlayer.play("walk_up")
			idle_direction = "up"
	else:
		if direction.x > 0:
			$AnimationPlayer.play("walk_side")
			idle_direction = "side"
			$Sprite2D.scale.x = 0.9
		elif direction.x < 0:
			$AnimationPlayer.play("walk_side")
			idle_direction = "side"
			$Sprite2D.scale.x = -0.9
	#animations for Idle
	if speed == 0:
		$AnimationPlayer.play("idle_" + idle_direction)


func _on_timer_timeout() -> void:
	if roaming == true:
		speed = 50
		x_direction = [-1, 1].pick_random()
		y_direction = [-1, 1].pick_random()
	

func _on_view_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		roaming = false
	
func update_target_position(target: Vector2):
	nav_agent.target_position = target


func _on_view_body_exited(body: Node2D) -> void:
	roaming = true
	
