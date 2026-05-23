extends Node2D

@onready var button = $CanvasLayer/Button
@onready var button_3 = $CanvasLayer/Button3
@onready var button_2 = $CanvasLayer/Button2

func _ready ():
	button_2.hide()
	button_3.hide()
	button.show()

func _on_button_pressed():
	
	button_2.show()
	button_3.show()
	button.hide()
	
func _on_button_3_pressed():
	pass
