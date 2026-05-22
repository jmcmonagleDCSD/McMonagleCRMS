extends Node2D


func _on_node_2d_pressed() -> void:
	$teach.animation("eat happy")

func _on_area_2d_pressed() -> void:
	$teach.animation("kobayashi")

func _on_area_2d_2_pressed() -> void:
	$teach.animation("sam")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("E"):
		$teach.animation("crazy")
