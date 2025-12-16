extends CharacterBody2D
var jumpheight = -300
var G = 6
@onready var player = $Sprite2D
func _process(delta: float) -> void:
	velocity.y += G
	if Input.is_action_just_pressed("jump"):
		velocity.y = jumpheight
		animate()





	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://flappybird/ui/flappymenu.tscn")
		
		
func animate():
	$AnimationPlayer.play("flap")
