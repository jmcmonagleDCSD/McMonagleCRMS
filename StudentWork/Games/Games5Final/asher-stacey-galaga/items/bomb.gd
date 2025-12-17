extends Area2D
var move=0
var move2=0
var x_position
var max_=550
var max=200
var can_que=true
var direction
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	if can_que==true:
		await get_tree().create_timer(4).timeout
		$AnimatedSprite2D.play("explode")
		await get_tree().create_timer(0.1).timeout
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	x_position=Galaga.x_position
	direction  = position.direction_to(Galaga.position)
	position.x+=direction.x*2

	
		
			
	position.y=move2
	move2+=0.5
	
