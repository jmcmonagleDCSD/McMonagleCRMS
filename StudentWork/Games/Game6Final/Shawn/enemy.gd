extends CharacterBody2D

var speed = 290
var cantern= true
func _process(delta):
	velocity.x += speed 
	
	if is_on_wall():
		if cantern:
			cantern = false
			speed*= -1 
			await get_tree().create_timer(.2).timeout
			cantern=true
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): 
		body.takedamage()
