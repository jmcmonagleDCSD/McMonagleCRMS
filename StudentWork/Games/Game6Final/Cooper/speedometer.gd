extends Control

var bike 
var speed = 0

func _ready() -> void:
	$Label.text = str(speed)
	bike = get_tree().get_first_node_in_group("Bikes")

func _process(delta: float) -> void:
	if Input.is_action_pressed("Forward"):
		speed = bike.velocity.x/40
		$Label.text = str(speed)
	else: 
		speed = bike.velocity.x/40
		$Label.text = str(speed)
	
	
	
	
	

	
