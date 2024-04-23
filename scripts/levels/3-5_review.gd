extends Node2D
@onready var gainEquation = $GainEquation
"""
name: 3-5_review.gd
description: This script manages the review of chapter 2

"""
var index = 1 #the index of the current question

func _ready():
	gainEquation.show()
	question()

func question():
	gameController.triggerDialogue("chapter3", "reviewQuestion" + str(index))

func answer(correct):
	if(correct):
		# Progress to the next question    
		if(index < 3):
			index += 1
			question()
		else:
		# If the player reaches the last question
			await gameController.radarPartCollected(2)
			gameController.changeScene("4-0_desertSplash")
	else:
		question()  


func printDialogue(param):
	print(param)
