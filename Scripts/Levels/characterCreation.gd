extends Node2D

"""
	name: characterCreation.gd
	description: This script controls the creation of Rodger

"""
var pronounButtons = []
var voiceButtons = []
var appearenceButtons = []

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
	# Deselects all pronoun options and marks the button pressed as selected
	for pronounButton in pronounButtons:
		pronounButton.set_pressed(false)
	button_pressed.set_pressed(true)

	# Sets the player's pronouns
	if(button_pressed.name == "She"): # Sets pronouns to she/her
		print("Pronoun Seleceted: She/Her")
	elif(button_pressed.name == "He"): # Sets pronouns to he/him
		print("Pronoun Seleceted: He/Him")
	elif(button_pressed.name == "They"): # Sets pronouns to they/them
		print("Pronoun Seleceted: They/Them")
	else:
		print(button_pressed.name)

# Called when a button is pressed from the voice list
func on_voice_button_pressed(button_pressed):
	# Deselects all voice options and marks the button pressed as selected
	for voiceButton in voiceButtons:
		voiceButton.set_pressed(false)
	button_pressed.set_pressed(true)

	# Sets the player's voice
	if(button_pressed.name == "Voice1"): # Sets voice to voice 1
		print("Voice Seleceted: *Play Voice 1")
	elif(button_pressed.name == "Voice2"): # Sets voice to voice 2
		print("Voice Seleceted: *Play Voice 2")
	else:
		print(button_pressed.name)

# Called when a button is pressed from the pronouns list
func on_appearance_button_pressed(button_pressed):
	# Deselects all appearance options and marks the button pressed as selected
	for appearenceButton in appearenceButtons:
		appearenceButton.set_pressed(false)
	button_pressed.set_pressed(true)

	# Sets the player's appearance
	if(button_pressed.name == "Red"): # Sets appearance to preset 1
		print("Appearance Seleceted: Preset 1")
	elif(button_pressed.name == "Blue"): # Sets appearance to preset 2
		print("Appearance Seleceted: Preset 2")
	elif(button_pressed.name == "Orange"): # Sets appearance to preset 3
		print("Appearance Seleceted: Preset 3")
	elif(button_pressed.name == "Pink"): # Sets appearance to preset 4
		print("Appearance Seleceted: Preset 4")
	else:
		print(button_pressed.name)

# Called when a player confirm's their character
func on_character_creation_confirm():
	print("SAVE CHARACTER")
	gameController.changeScene("0-3_shipInterior")
