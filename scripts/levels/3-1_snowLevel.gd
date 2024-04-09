extends Node2D


func _on_interact_trigger_player_interact():
	gameController.triggerDialogue("chapter3", "chapter3_3")


func _on_area_trigger_player_interact():
	gameController.triggerDialogue("chapter3", "chapter3_2")
