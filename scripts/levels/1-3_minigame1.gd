extends Node2D
@onready var player = $player
@onready var alien = $alien
"""
	name: 1-3_minigame1.gd
	description: This script manages minigame 1

"""

var questions = [1,2,3,4,5,6,7]
var nextQuestion = 0 #the index of the current question
var progession = 0

func _ready():
	question()

func question():
	nextQuestion = randi_range(0, questions.size() - 1)
	gameController.triggerDialogue("chapter1", "minigameQuestion" + str(questions[nextQuestion]))

func answer(correct):
	if(correct):
		questions.remove_at(nextQuestion)
		if(progession < 8):
			progession += 1
			player.position.x += 100
		if(questions.size() == 0):
			gameController.changeScene("1-4_dialogue", "res://assets/audio/music/swamp-intro.ogg", "res://assets/audio/music/swamp-body.ogg")
		else:
			await get_tree().create_timer(2.0).timeout
			question()
	else:
		if(progession > 0):
			progession -= 1
			player.position.x -= 100
		await get_tree().create_timer(2.0).timeout
		question()

	
