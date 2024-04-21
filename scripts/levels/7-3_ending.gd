extends Node2D
"""
name: 7-3_ending.gd
description: This script manages the ending cutscene

"""
. 
func _on_timer_timeout():
	gameController.changeScene("7-4_credits", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")