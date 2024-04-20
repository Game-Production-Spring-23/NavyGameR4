extends Node2D

func _ready():
	gameController.triggerDialogue("chapter6","chapter6_1")

func _on_interact_NPC_1_trigger_player_interact():
	gameController.triggerDialogue("chapter6","chapter6_NPC_3")






func _on_area_trigger_player_interact():
	gameController.changeScene("6-1-2_cafeLevel")
