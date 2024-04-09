extends Node2D
func _ready():
	gameController.triggerDialogue("chapter3", "chapter3_4")
	
func endDialogue3():
	gameController.changeScene("3-5_review", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")

