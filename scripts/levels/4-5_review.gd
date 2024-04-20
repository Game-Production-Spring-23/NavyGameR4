extends Node2D
"""
name: 4-5_review.gd
description: This script manages the review of chapter 4

"""
var index = 1 #the index of the current question

func _ready():
	question()

func question():
	gameController.triggerDialogue("chapter4", "reviewQuestion" + str(index))

func answer(correct):
	if(correct):
		# Progress to the next question    
		if(index < 3):
			index += 1
			question()
		else:
		# If the player reaches the last question
			gameController.changeScene("5-0_oceanSplash")
	else:
		question()  


func printDialogue(param):
	print(param)
