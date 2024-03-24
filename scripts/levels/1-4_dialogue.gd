extends Node2D
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
@onready var messageAnimationPlayer = $Backgrounds/Message/AnimationPlayer
@onready var background = $Backgrounds/Background
@onready var label = $Backgrounds/Background/Label #REMOVE ONCE WE GET BACKGROUND ASSETS

"""
	name: 1-4_dialogue.gd
	description: This script manages the dialogue between minigame 1 and review

"""
# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	loadDariaCatchDialogue()

# Loads dialogue after minigame 1
func loadDariaCatchDialogue():
	label.text = "Swamp Background"
	gameController.triggerDialogue("chapter1", "tutorial4")

# Loads dialogue between Roger, Daria, and Ranger
func loadCommsDialogue():
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	label.text = "Ship Interior Background"
	animationPlayer.play_backwards("Fade")
	gameController.triggerDialogue("chapter1", "tutorial5")

# Loads review 1
func endDialogue():
	messageAnimationPlayer.play("show")
	await messageAnimationPlayer.animation_finished
	gameController.changeScene("1-5_review", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")
