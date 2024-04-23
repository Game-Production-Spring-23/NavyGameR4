extends Node2D
"""
name: 2-5_review.gd
description: This script manages the review of chapter 3

"""
var index = 1 #the index of the current question

func _ready():
	question()

func question():
	gameController.triggerDialogue("chapter2", "reviewQuestion" + str(index))

func answer(correct):
	if(correct):
		# Progress to the next question    
		if(index < 3):
			index += 1
			question()
		else:
		# If the player reaches the last question
			await gameController.radarPartCollected(1)
			gameController.changeScene("3-0_mountainSplash")
	else:
		question()  


func printDialogue(param):
	print(param)
