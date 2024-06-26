extends Node2D
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
@export var textureRect: Node
@export var timer: Node

"""
	name: 1-2_minigame1splash.gd
	description: This script manages the minigame splash screen and loads Minigame 5

"""

#The timer automatically starts. When it's done, transition to the next slide and run the timer again. 
func _on_timer_timeout():
	gameController.changeScene("5-3_minigame5", null, "res://assets/audio/music/minigame.ogg")

#Skips intro cutscene when button pressed		
func _on_button_pressed():
	gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
	gameController.changeScene("5-3_minigame5", null, "res://assets/audio/music/minigame.ogg")
