extends AnimatedSprite2D

var gravity = 50
var jump_hiegh = 1200


func _process(delta) 
	velocity.y = gravity

if input.is_action_just_pressed(jump)

animation.play("jump")


func bounce(bounce_height): 
	velocity.y = bounce_height





move_and_slide()
