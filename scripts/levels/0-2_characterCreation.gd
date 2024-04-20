extends Node2D

"""
name: characterCreation.gd
description: This script controls the creation of Rodger

"""
var pronounButtons = []
var voiceButtons = []
var appearenceButtons = []

var pronouns = ["she", "her", "hers"]
var voice = "voice1"
var color = "purple"

# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	# Gets each button in the pronouns group and connects it to on_pronoun_button_pressed
	for button in get_tree().get_nodes_in_group("pronounButtons"):
		pronounButtons.append(button)
		button.pressed.connect(on_pronoun_button_pressed.bind(button));

	# Gets each button in the voice group and connects it to on_voice_button_pressed
	for button in get_tree().get_nodes_in_group("voiceButtons"):
		voiceButtons.append(button)
		button.pressed.connect(on_voice_button_pressed.bind(button));

	# Gets each button in the appearance group and connects it to on_appearance_button_pressed
	for button in get_tree().get_nodes_in_group("appearenceButtons"):
		appearenceButtons.append(button)
		button.pressed.connect(on_appearance_button_pressed.bind(button));

	# Sets defaults
	pronounButtons[0].set_pressed(true)
	voiceButtons[0].set_pressed(true)
	appearenceButtons[0].set_pressed(true)
	print("Pronoun Seleceted: She/Her")
	print("Voice Seleceted: *Play Voice 1")
	print("Appearance Seleceted: Preset 1")

# Called when a button is pressed from the pronouns list
func on_pronoun_button_pressed(button_pressed):
	gameController.playSound("res://assets/audio/sfx/gui-select.ogg")
	# Deselects all pronoun options and marks the button pressed as selected
	for pronounButton in pronounButtons:
		pronounButton.set_pressed(false)
	button_pressed.set_pressed(true)

	# Sets the player's pronouns
	if(button_pressed.name == "She"): # Sets pronouns to she/her
		pronouns = ["she", "her", "hers"]
	elif(button_pressed.name == "He"): # Sets pronouns to he/him
		pronouns = ["he", "him", "his"]
	elif(button_pressed.name == "They"): # Sets pronouns to they/them
		pronouns = ["they", "them", "their"]
	else:
		print(button_pressed.name)

# Called when a button is pressed from the voice list
func on_voice_button_pressed(button_pressed):
	#gameController.playSound("res://assets/audio/sfx/gui-select.ogg")
	# Deselects all voice options and marks the button pressed as selected
	for voiceButton in voiceButtons:
		voiceButton.set_pressed(false)
	button_pressed.set_pressed(true)

	# Sets the player's voice
	if(button_pressed.name == "Voice1"): # Sets voice to voice 1
		gameController.playSound("res://assets/audio/sfx/F_Ranger_Hey3.ogg")
		voice = "voice1"
	elif(button_pressed.name == "Voice2"): # Sets voice to voice 2
		gameController.playSound("res://assets/audio/sfx/M_Ranger_Hey3.ogg")
		voice = "voice2"
	else:
		print(button_pressed.name)

# Called when a button is pressed from the pronouns list
func on_appearance_button_pressed(button_pressed):
	gameController.playSound("res://assets/audio/sfx/gui-select.ogg")
	# Deselects all appearance options and marks the button pressed as selected
	for appearenceButton in appearenceButtons:
		appearenceButton.set_pressed(false)
	button_pressed.set_pressed(true)

	# Sets the player's appearance
	if(button_pressed.name == "Purple"): # Sets appearance to preset 3
		color = "purple"
	elif(button_pressed.name == "Red"): # Sets appearance to preset 1
		color = "red"
	elif(button_pressed.name == "Pink"): # Sets appearance to preset 4
		color = "pink"
	elif(button_pressed.name == "Blue"): # Sets appearance to preset 2
		color = "blue"
	else:
		print(button_pressed.name)

# Called when the player confirms their character
func on_character_creation_confirm():
	gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
	gameController.player = oPlayer.new(pronouns, voice, color)
	gameController.changeChapter()