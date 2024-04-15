extends Node2D




func _on_interact_NPC_2_trigger_player_interact():
	gameController.triggerDialogue("chapter2", "chapter2_NPC_2")


func _on_interact_NPC_1_trigger_player_interact():
	gameController.triggerDialogue("chapter2", "chapter2_NPC_1")


func _on_interact_NPC_3_trigger_player_interact():
	gameController.triggerDialogue("chapter2", "chapter2_NPC_3")


func _on_area_trigger_player_interact():
	gameController.triggerDialogue("chapter2", "chapter2_2")
	
