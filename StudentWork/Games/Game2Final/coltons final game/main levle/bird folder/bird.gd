extends CharacterBody2D
var jump = -500          
var speed= 25
# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	velocity.y +=speed
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump
	
	move_and_slide()
func animations():
	if velocity.x >0:
		$AnimatedSprite2D. play("flying")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().paused=true
