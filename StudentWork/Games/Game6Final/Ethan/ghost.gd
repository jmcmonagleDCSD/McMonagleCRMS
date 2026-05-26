extends CharacterBody2D

var player
var speed = 100
var direction = Vector2.DOWN

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var knight: CharacterBody2D = $"../knight"


func _ready():
	player = get_tree().get_first_node_in_group("knight")

func _process(delta):
	velocity = global_position.direction_to(knight.global_position) * speed
	move_and_slide()
	set_animations()
	
func set_animations():
	animation_player.play("base-animation")
	if velocity.x > 0:
		sprite_2d.scale.x = -1
	elif velocity.x < 0:
		sprite_2d.scale.x = 1
