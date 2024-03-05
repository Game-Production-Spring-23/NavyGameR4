extends Area2D

"""
name: interact.gd
description: This script controls an interactable component

"""
signal player_enter
signal player_exit

func _ready():
	body_entered.connect(Callable(self, "_on_body_entered"))
	body_exited.connect(Callable(self, "_on_body_exit"))

func _on_body_entered(body):
	if body.name == "Player":
		player_enter.emit()

func _on_body_exit(body):
	if body.name == "Player":
		player_exit.emit()
