extends Label




var score =0

func _ready()-> void:
	score=1
	

# Called when the noprint(score)
	text="Score: " + str(score)
	

	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.




func _on_timer_timeout() -> void:
	score = score + 1 

	text="Score: " + str(score)
	
	
	
	
	
	
