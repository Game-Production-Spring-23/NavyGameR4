extends Node2D
func _ready():
	gameController.triggerDialogue("chapter2", "chapter2_3")
	
func endDialogue2():
	gameController.changeScene("2-5_review", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")

