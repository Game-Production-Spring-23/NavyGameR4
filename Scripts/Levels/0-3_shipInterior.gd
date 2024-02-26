extends Node2D

"""
	name: 0-3_shipInterior.gd
	description: This script controls the level managment of the ship's interior

"""
# SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	gameController.triggerDialogue("chapter1", "tutorial1")

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		gameController.changeScene("testEnd")
