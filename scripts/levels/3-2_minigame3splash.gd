extends Node2D
#The timer automatically starts. When it's done, transition to the next slide and run the timer again. 
func _on_timer_timeout():
	gameController.changeScene("3-3_minigame3", null, "res://assets/audio/music/minigame.ogg")

#Skips intro cutscene when button pressed		
func _on_button_pressed():
	gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
	gameController.changeScene("3-3_minigame3", null, "res://assets/audio/music/minigame.ogg")
