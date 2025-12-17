extends Node2D
@onready var label: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var button: Button = $Button 
func _process(delta: float) -> void:
	if $AnimatedSprite2D/Button.button_pressed:
		animated_sprite_2d.play("click")
		
