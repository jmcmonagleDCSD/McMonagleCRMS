extends Control

func _process(delta: float) -> void:
	if Global.grade == 1:
		$HBoxContainer/Label.text = "Your patience grade: F" 
	if Global.grade == 2:
		$HBoxContainer/Label.text = "Your patience grade: D" 
	if Global.grade == 3:
		$HBoxContainer/Label.text = "Your patience grade: C" 
	if Global.grade == 4:
		$HBoxContainer/Label.text = "Your patience grade: B" 
	if Global.grade == 5:
		$HBoxContainer/Label.text = "Your patience grade: A" 
