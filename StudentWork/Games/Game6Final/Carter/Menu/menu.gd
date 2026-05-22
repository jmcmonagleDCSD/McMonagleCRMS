extends Control



func _ready() -> void:
	if Global.grade == 1:
		$Grade.text = "Your patience grade: F" 
	if Global.grade == 2:
		$Grade.text = "Your patience grade: D" 
	if Global.grade == 3:
		$Grade.text = "Your patience grade: C" 
	if Global.grade == 4:
		$Grade.text = "Your patience grade: B" 
	if Global.grade == 5:
		$Grade.text = "Your patience grade: A" 
