extends Node2D
@export var spell_scene: PackedScene
@export_range(0, 50) var fire_rate: float = 1.0
@onready var sprite_2d = $Sprite2D



var can_shoot = true


func _process(delta):
	var mouse = get_global_mouse_position()
	look_at(mouse)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		shoot()


	if mouse.x > global_position.x:
		sprite_2d.flip_v = false 
	else:
		sprite_2d.flip_v = true 


func shoot():
	if can_shoot:
		can_shoot = false
		var spell = spell_scene.instantiate()
		spell.global_rotation = global_rotation 
		get_tree().get_first_node_in_group("spells").add_child(spell)
		spell.global_position = sprite_2d.global_position
		await  get_tree().create_timer(1/ fire_rate).timeout
		can_shoot = true
		add_child(spell)
		spell.global_position = sprite_2d.position
