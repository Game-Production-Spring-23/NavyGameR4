extends Node

func _ready():
	$intro.play()

func _on_intro_finished():
	$body.play()
