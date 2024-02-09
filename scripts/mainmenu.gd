extends Node2D
@onready var gameController = get_tree().root.get_node("/root/GameController")
@onready var sceneTransition = get_tree().root.get_node("/root/SceneTransition")
#poor implementation ^

@export var sceneName : String

func _on_start_button_pressed():
	sceneTransition.loadScene(sceneName)
	# gameController.changeScene("res://scenes/" + sceneName + ".tscn")	


func _on_option_button_pressed():
	sceneName = "options"
	sceneTransition.loadScene(sceneName)


func _on_chapter_select_button_pressed():
	#sceneName will not update when pressing on chapterSelect Button. 
	sceneName = "chapterSelect"
	sceneTransition.loadScene(sceneName)

func _on_end_button_pressed():
	get_tree().quit()	



