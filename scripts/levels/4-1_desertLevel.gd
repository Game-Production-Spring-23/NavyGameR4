extends Node2D


func _on_interact_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_NPC_2")


func _on_interact_2_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_NPC_1")


func _on_interact_3_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_NPC_3")


func _on_interact_4_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_NPC_4") 


func _on_interact_5_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_NPC_5")


func _on_interact_6_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_NPC_6")


func _on_interact_main_trigger_player_interact():
	gameController.triggerDialogue("chapter4", "chapter4_2")
