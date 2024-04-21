extends Node2D
func _ready():
	gameController.triggerDialogue("chapter5", "chapter5_1")


func _on_area_trigger_player_interact():
	gameController.triggerDialogue("chapter5", "chapter5_2")


func _on_area_trigger_2_player_interact():
	gameController.triggerDialogue("chapter5", "chapter5_3")
