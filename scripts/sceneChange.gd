extends Area2D
@export var nextScene : String
@onready var sceneName = nextScene

func _on_body_entered(_body):
	get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneName + ".tscn")
