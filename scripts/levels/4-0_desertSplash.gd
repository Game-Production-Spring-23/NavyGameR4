extends Node2D
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
@export var textureRect: Node
@export var timer: Node

"""
	name: swampSplash.gd
	description: This script manages the swamp splash screen and loads the swamp level after

"""

#The timer automatically starts. When it's done, transition to the next slide and run the timer again. 
func _on_timer_timeout():
	gameController.changeScene("4-1_desertLevel", "res://assets/audio/music/desert-intro.ogg", "res://assets/audio/music/desert-body.ogg")

#Skips intro cutscene when button pressed		
func _on_button_pressed():
	gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
	gameController.changeScene("4-0_desertSplash.tscn", "res://assets/audio/music/desert-intro.ogg", "res://assets/audio/music/desert-body.ogg")
		
	
	
	

