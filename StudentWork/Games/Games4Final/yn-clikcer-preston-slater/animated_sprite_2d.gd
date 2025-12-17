extends AnimatedSprite2D

extends AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var button: Button = $Button 
func _process(delta: float) -> void:
	if button.button_pressed:
		animated_sprite_2d.play("click")
