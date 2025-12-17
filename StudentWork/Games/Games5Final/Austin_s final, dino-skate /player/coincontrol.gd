extends Control

var coins
var score = 0

	
func _ready() -> void:
	coins = get_tree().get_nodes_in_group("coin")
	print(coins)
	await get_tree().process_frame
	for coin in coins:
		coin.pick_up.connect(update)

func update(amount:int):
	score += 1
	$HBoxContainer/coinsnumber.text = str(score)
	
