extends Node2D
"""
name: 6-5_review.gd
description: This script manages the review of chapter 6

"""
var index = 1 #the index of the current question

func _ready():
	question()

func question():
	gameController.triggerDialogue("chapter6", "reviewQuestion" + str(index))

func answer(correct):
	if(correct):
		# Progress to the next question    
		if(index < 3):
			index += 1
			question()
		else:
		# If the player reaches the last question
			gameController.changeScene("testEnd", "res://assets/audio/music/swamp-intro.ogg", "res://assets/audio/music/swamp-body.ogg")
	else:
		question()  


func printDialogue(param):
	print(param)
