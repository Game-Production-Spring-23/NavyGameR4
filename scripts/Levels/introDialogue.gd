extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/intro_sequence/main.dialogue"))
