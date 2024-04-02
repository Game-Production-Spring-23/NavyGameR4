extends Node2D
func _ready():
	gameController.triggerDialogue("chapter6", "chapter6_4")
	
func endDialogue6():
	gameController.changeScene("6-5_review", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")

