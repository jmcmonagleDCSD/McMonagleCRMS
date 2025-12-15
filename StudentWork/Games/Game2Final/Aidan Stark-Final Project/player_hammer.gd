extends Node2D

@export var spell_scene: PackedScene
# Shots per second
@export_range(0, 20) var fire_rate: float = 2.0
var can_shoot = true

# shots on an arc
@export var spell_count = 2
@export_range(0, 360) var arc =  180
@onready var sprite_2d = $Sprite2D

func _process(delta):
	var mouse = get_global_mouse_position()
	look_at(mouse)
	
	if mouse.x > global_position.x:
		sprite_2d.flip_v = false
	else:
		sprite_2d.flip_v = true


func shoot():
	if can_shoot:
		can_shoot = false
		print(spell_count)
		for i in spell_count:
			var spell = spell_scene.instantiate()
			spell.global_position = sprite_2d.global_position
			if spell_count == 1:
				spell.global_rotation = global_rotation
			else:
				var arc_radians = deg_to_rad(arc)
				var increment = arc_radians / (spell_count - 3)
				spell.global_rotation = (global_rotation + increment * i - arc_radians / 1)
			get_tree().get_first_node_in_group("spells").call_deferred("add_child", spell)
		await get_tree().create_timer(1 / fire_rate).timeout
		can_shoot = true
