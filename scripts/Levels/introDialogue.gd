extends Node2D

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_up"):
		gameController.triggerDialogue("chapter1", "tutorial1")
