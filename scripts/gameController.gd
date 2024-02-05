extends Node

func changeScene(scenePath):
	#handle transitions, moving information etc.
	get_tree().change_scene_to_file(scenePath)
