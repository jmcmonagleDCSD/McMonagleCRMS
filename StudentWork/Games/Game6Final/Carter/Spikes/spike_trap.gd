extends Area2D

var active = false
var player 
var can_activate = true

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
	
func _process(delta: float) -> void:
	if player.position.x >= position.x - 10 and player.position.x <= position.x + 10:
		if not active:
			if can_activate:
				active = true
				activate()
	else:
		if active:
			active = false
			deactiveate()
func activate():
		can_activate = false
		$AnimatedSprite2D.play("stab")
		$CollisionPolygon2D.disabled = false
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.play("active")

func deactiveate():
	await get_tree().create_timer(3).timeout
	$AnimatedSprite2D.play("return")
	$CollisionPolygon2D.disabled = true
	active = false
	can_activate= true

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.reset.emit()
		get_tree().paused = true
		await get_tree().create_timer(0.3).timeout
		get_tree().paused = false
		body.velocity.y = 0
		body.position = Vector2(49, 144)
