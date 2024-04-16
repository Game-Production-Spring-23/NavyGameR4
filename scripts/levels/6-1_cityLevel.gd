extends Node2D

func _ready():
	gameController.triggerDialogue("chapter6","chapter6_1")

func _on_interact_NPC_1_trigger_player_interact():
	gameController.triggerDialogue("chapter6","chapter6_NPC_3")


func _on_interact_NPC_2_trigger_player_interact():
	gameController.triggerDialogue("chapter6","chapter6_NPC_2")


func _on_interact_NPC_3_trigger_player_interact():
	gameController.triggerDialogue("chapter6","chapter6_NPC_1")


func _on_interact_Yosie_trigger_player_interact():
	gameController.triggerDialogue("chapter6","chapter6_3")
