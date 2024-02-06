extends Node2D
@onready var gameController = get_tree().root.get_node("/root/GameController")
@onready var sceneTransition = get_tree().root.get_node("/root/SceneTransition")
#poor implementation ^

@export var sceneName : String

func _on_start_button_pressed():
	sceneTransition.loadScene(sceneName)
	# gameController.changeScene("res://scenes/" + sceneName + ".tscn")

func _on_end_button_pressed():
	get_tree().quit()	
