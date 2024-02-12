extends CanvasLayer

"""
	name: scene_transition.gd
	description: This script manages loading between scenes and triggering a loading/transition screen

"""
var animationPlayer

#		SETUP FUNCTIONS
# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer = get_node("FadeScreen/AnimationPlayer")

#		FUNCTIONS
# Fades in transition screen, loads the next scene, and fades out
func loadScene(sceneName):
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/" + sceneName + ".tscn")
	animationPlayer.play_backwards("Fade")
