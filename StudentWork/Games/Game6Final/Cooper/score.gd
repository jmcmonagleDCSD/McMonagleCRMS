extends Control

var bike 
var score = 0

func _ready() -> void:
	$Label.text = str(score)
	bike = get_tree().get_first_node_in_group("Bikes")

func _process(delta: float) -> void:
	if bike.rotation < 0:
		score += 1
		$Label.text = str(score)
		Global.score = score
