extends Node2D

"""
name: mainmenu.gd
description: This script controls the functions and screens of the main menu
"""
var menuScreens = []
var busIndex = AudioServer.get_bus_index("Master")
# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	# Adds all menu screens to list
	menuScreens.append(get_node("UI/MainMenuScreen"))
	menuScreens.append(get_node("UI/ChapterSelectScreen"))
	menuScreens.append(get_node("UI/OptionsScreen"))

	# Gets each button in main menu and connects it to on_button_pressed
	for button in get_tree().get_nodes_in_group("MainMenuButtons"):
		button.pressed.connect(on_button_pressed.bind(button));
	# Gets each button in chapter select and connects it to on_button_pressed
	for button in get_tree().get_nodes_in_group("ChapterSelectButtons"):
		button.pressed.connect(on_button_pressed.bind(button));

	displayMenuScreen(0)

# Called when a button is pressed from main menu
func on_button_pressed(button_pressed):
	if(button_pressed.name == "startButton"): # Loads the options cutscene
		gameController.playSound("res://assets/audio/sfx/gui-confirmation.ogg")
		gameController.changeScene("0-1_introCutscene", null, "res://assets/audio/sfx/space-ambience.ogg")
	elif(button_pressed.name == "chapterSelectButton"): # Displays the chapter select screen
		gameController.playSound("res://assets/audio/sfx/gui-select.ogg")
		displayMenuScreen(1)
	elif(button_pressed.name == "optionButton"): # Displays the options screen
		gameController.playSound("res://assets/audio/sfx/gui-select.ogg")
		displayMenuScreen(2)
	elif(button_pressed.name == "backButton"): # Displays the main menu screen
		gameController.playSound("res://assets/audio/sfx/gui-select.ogg")
		displayMenuScreen(0)
	elif(button_pressed.name == "endButton"): # Quit the game
		get_tree().quit()
	else:
		print(button_pressed.name)

# Displays the a UI screen
func displayMenuScreen(screenNum):
	# Hides all screens
	for menuScreen in menuScreens:
		menuScreen.hide()

	# Displays the correct screen
	menuScreens[screenNum].show()










func _on_slow_pressed():
	gameController.textSpeed = 0.5


func _on_normal_pressed():
	gameController.textSpeed = 1


func _on_fast_pressed():
	gameController.textSpeed = 1.5


func _on_faster_pressed():
	gameController.textSpeed = 2


func _on_voice_slider_2_value_changed(value):
	AudioServer.set_bus_volume_db(busIndex,value)
