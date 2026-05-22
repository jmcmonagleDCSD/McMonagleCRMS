extends Area2D

var can_col = true
var player

func reset() -> void:
	$AnimationPlayer.play("idle")
	can_col = true
	Global.win = 0
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and can_col:
		$AnimationPlayer.play("Collect")
		can_col = false
		if body.velocity.y <= 0:
			Global.win += 1
	
func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	Global.reset.connect(reset)

func _process(delta: float) -> void:
	if Global.win >=2 and Global.grade != 1:
		get_tree().create_timer(4)
		get_tree().change_scene_to_file("res://Levels/win.tscn")
