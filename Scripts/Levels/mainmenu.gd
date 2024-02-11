extends Node2D

"""
name: mainmenu.gd
description: This script controls the functions and screens of the main menu
"""
var scene_transition
var menuScreens = []

# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	# Gets autoloads
	scene_transition = get_node("/root/SceneTransition");

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
		scene_transition.loadScene("1introCutscene")
	elif(button_pressed.name == "chapterSelectButton"): # Displays the chapter select screen
		displayMenuScreen(1)
	elif(button_pressed.name == "optionButton"): # Displays the options screen
		displayMenuScreen(2)
	elif(button_pressed.name == "backButton"): # Displays the main menu screen
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