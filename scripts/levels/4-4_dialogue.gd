extends Node2D
func _ready():
	gameController.triggerDialogue("chapter4", "chapter4_3")
	
func endDialogue4():
	gameController.changeScene("4-5_review", "res://assets/audio/music/menu-theme-intro.ogg", "res://assets/audio/music/menu-theme-body.ogg")

