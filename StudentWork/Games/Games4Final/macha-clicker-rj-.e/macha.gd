extends Node2D
var clicked = false
var score=0
@onready var label: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var button: Button = $Button
func _process(delta: float) -> void:
	if button.button_pressed and clicked ==false:
		animated_sprite_2d.play("clicked")
		add_score()
		clicked = true
func add_score():
		score +=1
		label.text="SIPS:"+ str(score)


func _on_button_button_up() -> void:
	clicked = false
