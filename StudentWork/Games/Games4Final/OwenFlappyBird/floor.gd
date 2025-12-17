extends StaticBody2D

func _process(delta: float) -> void:

	
	
	
	


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://node_2d.tscn")
