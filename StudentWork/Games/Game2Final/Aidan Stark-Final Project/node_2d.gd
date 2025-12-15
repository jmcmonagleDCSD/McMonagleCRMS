extends Node2D

@export var health = 10

signal died

func take_damage(damage_amount):
	health -= damage_amount
	if health <= 0:
		died.emit()
