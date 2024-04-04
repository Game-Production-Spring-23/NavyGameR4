extends Node2D

@export var travin: Sprite2D
@export var travinAnim: AnimationPlayer

#exports for the actual minigame nodes
@export var baseBar: Sprite2D
@export var movingBar: Area2D

var minigameActive = false
var barDirection = 1
var inGreenBar = false

"""
	name: 2-3_minigame2.gd
	description: This script manages minigame 2

"""

var questions = [1,2,3,4]
var progression = 0

#Hides the minigame bar and asks the first question
func _ready():
	baseBar.hide()
	question()
	
func _process(delta):
	#If the minigame is active, moves the small bar back and forth. Speed depends on which question the player is on
	if minigameActive:
		if movingBar.position.x > 810:
			barDirection = -1
		if movingBar.position.x < -810:
			barDirection = 1
		movingBar.position.x += 5*(progression+1)*barDirection
		
func _input(event):
	if (event is InputEventMouseButton && event.pressed && minigameActive):
		minigameActive = false
		#checks to see if the moving bar is within the green bar. Makes Roger answer correctly or incorrectly based on that
		if movingBar.position.x > -93 && movingBar.position.x < 93:
			await get_tree().create_timer(0.5).timeout
			baseBar.hide()
			rogerResponse(true)
		else:
			await get_tree().create_timer(0.5).timeout
			baseBar.hide()
			rogerResponse(false)
			
#Displays the question depending on the progression of the minigame
func question():
	gameController.triggerDialogue("chapter2", "minigameQuestion" + str(questions[progression]))

#Triggers Roger dialog depending on if the player clicked at the right time or not
func rogerResponse(correct):
	if correct:
		gameController.triggerDialogue("chapter2", "minigameQuestion" + str(questions[progression]) + "_Right")
	else:
		gameController.triggerDialogue("chapter2", "minigameQuestion" + str(questions[progression]) + "_Wrong")

#This is triggered after every Travin line. Starts up the actual timing minigame
func barAppear():
	minigameActive = true
	baseBar.show()
	movingBar.position.x = -800
	
#Handles progression and travin animations depending on roger's response to the questions
func answer(correct):
	if(correct):
		#This runs if there are questions left. otherwise, move on to the next scene
		if(progression < 3):
			#Travin happy animation
			travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_happy.png")
			travinAnim.current_animation = "hop"
			travinAnim.play()
			#Moves on to next question
			progression += 1
			await get_tree().create_timer(2.0).timeout
			#Sets travin back to neutral sprite and makes him ask the next question
			travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_neutral.png")
			question()
		else:
			travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_happy.png")
			travinAnim.current_animation = "hop"
			#CHANGE ONCE PROPER SCENE IS ADDED vvv
			gameController.changeScene("1-4_dialogue", "res://assets/audio/music/swamp-intro.ogg", "res://assets/audio/music/swamp-body.ogg")
	else:
		#Makes the player lose progress (assuming there is progress to be lost)
		if(progression > 0):
			progression -= 1
		#Angry travin sprite
		travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_mad.png")
		await get_tree().create_timer(2.0).timeout
		travin.texture = load("res://assets/images/sprites/minigame_2/shopkeep_sprite_neutral.png")
		question()

