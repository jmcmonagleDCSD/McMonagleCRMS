extends Node2D

@export var spell_scene: PackedScene

@export_range(0, 20) var fire_rate: float = 1.0
var can_shoot = true

@export var spell_count = 2
@export_range(0, 360) var arc = 20
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
		can_shoot = true
		for i in range(spell_count):
			var spell = spell_scene.instantiate()
			spell.global_position = sprite_2d.global_position
			var arc_radiens = deg_to_rad(arc)
			var increment = arc_radiens / (spell_count - 1)
			spell.global_rotation = (global_rotation + increment * i - arc_radiens / 2)
			
		
		
		await get_tree().create_timer(1 / fire_rate).timeout
		can_shoot = true
