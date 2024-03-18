extends Node2D

"""
name: 0-3_shipInterior.gd
description: This script controls the level managment of the ship's interior

"""
# References
var player
var camera
var daria

var darknessScreen
var wasdKeyScreen
var transitionScreen

var spawnPoints = []
var cameraPoints = []

var hasPlayerMovedOnce = true
var hadPlayerTalkedToRoger = false

# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	camera = get_node("Camera2D")
	daria = get_node("Daria")

	darknessScreen = get_node("CanvasLayer/Darkness/AnimationPlayer")
	wasdKeyScreen = get_node("CanvasLayer/WasdScreen/AnimationPlayer")
	transitionScreen = get_node("CanvasLayer/FadeScreen/AnimationPlayer")
	
	# Gets each spawnPoint in the spawnPoints group
	for spawnPoint in get_tree().get_nodes_in_group("Exits"):
		spawnPoints.append(spawnPoint)

	# Gets each cameraPoint in the cameraPoints group
	for cameraPoint in get_tree().get_nodes_in_group("CameraPoints"):
		cameraPoints.append(cameraPoint)
		
	await gameController.triggerDialogue("chapter1", "tutorial1")
	
func _input(event):
	# Makes WASD prompt disappear after moving
	if(!hasPlayerMovedOnce):
		if event.is_action_pressed("left") || event.is_action_pressed("right") || event.is_action_pressed("up") || event.is_action_pressed("down"):
			hasPlayerMovedOnce = true;
			wasdKeyScreen.play("fadeout")
	
# If player enter roger's module
func _on_roger_interact():
	hadPlayerTalkedToRoger = true
	gameController.triggerDialogue("chapter1", "tutorial2")

# Trigger Daria cutscene and dialogue
func _on_daria_interact():
	gameController.triggerDialogue("chapter1", "tutorial3")

# When the player enter the exit to area 2 in area 1
func _on_area1_exit():
	transitionScreen.play("Fade")
	await transitionScreen.animation_finished
	player.position  = spawnPoints[1].global_position 
	camera.position  = cameraPoints[1].global_position 
	transitionScreen.play_backwards("Fade")

# When the player enter the exit to area 1 or 3 in area 2
func _on_area2_exit():
	transitionScreen.play("Fade")
	await transitionScreen.animation_finished
	if(!hadPlayerTalkedToRoger):
		player.position  = spawnPoints[0].global_position 
		camera.position  = cameraPoints[0].global_position 
	else:
		player.position  = spawnPoints[2].global_position 
		camera.position  = cameraPoints[2].global_position 
	transitionScreen.play_backwards("Fade")

# When the player enter the exit to area 2 in area 3
func _on_area3_exit():
	transitionScreen.play("Fade")
	await transitionScreen.animation_finished
	player.position  = spawnPoints[1].global_position 
	camera.position  = cameraPoints[1].global_position 
	transitionScreen.play_backwards("Fade")

# When the player enter the exit to finish the level
func _on_level_finish():
	gameController.changeScene("1-0_swampSplash")

