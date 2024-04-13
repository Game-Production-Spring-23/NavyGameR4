extends Node2D
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
@export var textureRect: Node
@export var timer: Node

"""
	name: 4-2_minigame4splash.gd
	description: This script manages the minigame splash screen and loads Minigame 4 after

"""

#The timer automatically starts. When it's done, transition to the next slide and run the timer again. 
func _on_timer_timeout():
	gameController.changeScene("4-3_minigame4", null, "res://assets/audio/music/minigame.ogg")

#Skips intro cutscene when button pressed		
func _on_button_pressed():
	gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
	gameController.changeScene("4-3_minigame4", null, "res://assets/audio/music/minigame.ogg")
