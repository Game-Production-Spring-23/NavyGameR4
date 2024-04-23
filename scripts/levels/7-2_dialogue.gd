extends Node2D
"""
name: 7-2_dialouge.gd
description: This script manages the final review and dialogue

"""
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
@onready var message = $Backgrounds/Message
@onready var gainEquation = $GainEquation
var index = 1 #the index of the current question

# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	gainEquation.hide()
	message.hide()
	loadFinalDialogue_pt1()

# Loads inital dialouge
func loadFinalDialogue_pt1():
	gameController.triggerDialogue("finalReview", "finalReview_1")

# Loads final review
func loadFinalReview():
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	animationPlayer.play_backwards("Fade")
	message.show()
	question()

func question():
	gameController.triggerDialogue("finalReview", "reviewQuestion" + str(index))

func answer(correct):
	if(correct):
		# Progress to the next question    
		if(index < 18):
			index += 1
			if(index == 7):
				gainEquation.show()
			question()
		else:
			# If the player reaches the last question
			loadFinalDialogue_pt2()
	else:
		question()  

func printDialogue(param):
	print(param)

# Loads the dialouge after final review
func loadFinalDialogue_pt2():
	message.hide()
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	animationPlayer.play_backwards("Fade")
	await gameController.radarPartCollected(6)
	gameController.triggerDialogue("finalReview", "finalReview_2")

# Loads dialouge after part 2
func loadFinalDialogue_pt3():
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	animationPlayer.play_backwards("Fade")
	gameController.triggerDialogue("finalReview", "finalReview_3")

# Loads dialouge after part 3
func loadFinalDialogue_pt4():
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	animationPlayer.play_backwards("Fade")
	gameController.triggerDialogue("finalReview", "finalReview_4")

# Loads the ending cutscene
func loadEnding():
	gameController.changeScene("7-3_ending", null, "res://assets/audio/sfx/space-ambience.ogg")
