extends CharacterBody2D

const SPEED = 160

func _enabledprint():
	pass


func _ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	velocity.y += 50
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -850
		
	move_and_slide()

func _physics_process(delta: float) -> void:
	
	velocity.x = SPEED


func _on_completion_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://completion_menu.tscn")


func _on_completion_shape_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
