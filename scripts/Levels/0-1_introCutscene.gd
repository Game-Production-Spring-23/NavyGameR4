extends Node2D
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
@export var textureRect: Node
@export var timer: Node
var slide = 1

"""
	name: introCutscene.gd
	description: This script manages the intro cutscene and loads the intro dialouge afterwards

"""
#		FUNCTIONS
# Called whenever a key is pressed.
#func _input(event):
	## Check if the event is a key press event and if it's the space bar
	#if event.is_action_pressed("ui_accept"): # Change "ui_accept" to whatever action you're using for space bar
		## Call the finished function immediately
		#_on_video_stream_player_finished()
#
## Switches to intro dialouge as soon as intro cutscene finishes
#func _on_video_stream_player_finished():
	#gameController.changeScene("0-2_characterCreation", load("res://assets/audio/music/menu-theme-intro.ogg"), load("res://assets/audio/music/menu-theme-body.ogg"))
	
	

#The timer automatically starts. When it's done, transition to the next slide and run the timer again. 
func _on_timer_timeout():
	if (slide == 1):
		animationPlayer.play("Fade")
		await animationPlayer.animation_finished
		textureRect.texture = load("res://assets/images/intro-cutscene/introSlide2.png")
		animationPlayer.play_backwards("Fade")
		slide = 2
		timer.start()
		gameController.playSound("res://assets/audio/sfx/explosion.ogg")
	else:
		gameController.changeScene("0-2_characterCreation", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")

#Skips intro cutscene when button pressed		
func _on_button_pressed():
	gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
	gameController.changeScene("0-2_characterCreation", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")
		
	
	
	

