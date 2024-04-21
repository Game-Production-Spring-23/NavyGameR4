extends Node2D


func _on_area_trigger_player_interact():
	gameController.changeScene("7-2_dialogue", "res://assets/audio/music/swamp-intro.ogg", "res://assets/audio/music/swamp-body.ogg")
