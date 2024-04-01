extends Node2D

@export var travin: Sprite2D
@export var travinAnim: AnimationPlayer

"""
	name: 2-3_minigame2.gd
	description: This script manages minigame 2

"""

var questions = [1,2,3,4]
var nextQuestion = 0 #the index of the current question
var progession = 0

func _ready():
	question()

func question():
	gameController.triggerDialogue("chapter2", "minigameQuestion" + str(questions[progession]))

func answer(correct):
	if(correct):
		if(progession < 3):
			travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_happy.png")
			travinAnim.current_animation = "hop"
			travinAnim.play()
			progession += 1
			await get_tree().create_timer(2.0).timeout
			travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_neutral.png")
			question()
		else:
			travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_happy.png")
			travinAnim.current_animation = "hop"
			#CHANGE ONCE PROPER SCENE IS ADDED vvv
			gameController.changeScene("1-4_dialogue", "res://assets/audio/music/swamp-intro.ogg", "res://assets/audio/music/swamp-body.ogg")
	else:
		if(progession > 0):
			progession -= 1
		travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_mad.png")
		await get_tree().create_timer(2.0).timeout
		travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_neutral.png")
		question()

	
