extends ColorRect

@onready var hi=$Area2D4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	hi.position.x +=2

func _on_timer_timeout() -> void:
	$Timer/Label.visible=false
	$Timer/ColorRect.visible=false

	$Timer2/ColorRect.visible=true
	$Timer2/Label.visible=true
	


func _on_timer_2_timeout() -> void:
	
	$Timer2/ColorRect.visible=false
	$Timer2/Label.visible=false
	
	$Timer3/ColorRect.visible=true
	$Timer3/Label.visible=true
	

func _on_timer_3_timeout() -> void:
	$Timer3/ColorRect.visible=false
	$Timer3/Label.visible=false


func _on_timer_4_timeout() -> void:
	$Timer3/ColorRect.visible=false
	$Timer3/Label.visible=false
	
	
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
