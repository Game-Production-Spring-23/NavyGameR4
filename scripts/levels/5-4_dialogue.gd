extends Node2D
func _ready():
	gameController.triggerDialogue("chapter5", "chapter5_4")
	
func endDialogue5():
	gameController.changeScene("5-5_review", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")

