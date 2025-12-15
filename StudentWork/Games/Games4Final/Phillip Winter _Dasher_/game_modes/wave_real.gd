extends CharacterBody2D

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		position.y -= 2
	else:
		position.y += 2
