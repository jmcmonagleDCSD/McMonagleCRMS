extends Button

var click_count = 0
const MAX_CLICKS = 10

func _on_pressed():
	click_count += 1
	if click_count >= MAX_CLICKS:
		disabled = true
		text = ""
	else:
		print("Clicks left: ", MAX_CLICKS - click_count)
