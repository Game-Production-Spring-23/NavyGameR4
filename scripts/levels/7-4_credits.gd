extends Node2D
"""
name: 7-4_credits.gd
description: This script manages the credits scroll
"""
@onready var credits = $UI/BackgroundTexture/CreditsScroll

var scroll_speed = 100  # Adjust this value to control the speed of scrolling
var wait_time = 3.0

var timer = 0
var isCreditsFinished = false
var isGameFinished = false
var current_pos
var final_pos

func _ready():
	# sets the current, and final positions, final position should cut off about 1080px, to make sure the thank message is the last thing seen
	current_pos = credits.position.y
	final_pos = -credits.size.y + 1080
	timer = wait_time

	
func _process(delta):
	# Counts down a timer, does this once at the start and again after the credits is finished
	if (timer > 0):
		timer -= delta

		# After the second time load main menu
		if(isCreditsFinished && !isGameFinished):
			isGameFinished = true
			endGame()

	# Moves the credits, only moves if the credits current position isn't at the final position
	elif (current_pos > final_pos):
		current_pos = credits.position.y
		credits.position.y = current_pos - scroll_speed * delta
	# Sets timer again once the credits reaches its final position
	elif(current_pos <= final_pos && !isCreditsFinished):
		isCreditsFinished = true
		timer = wait_time

func endGame():
	gameController.changeScene("0-0_mainMenu", "res://assets/audio/music/title-intro.ogg", "res://assets/audio/music/title-body.ogg")
