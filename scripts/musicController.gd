extends Node

func _ready():
	if ($intro.stream):
		$intro.play()
		print("intro played")
	else:
		$body.play()
		print("body played")

func _on_intro_finished():
	print("body played")
	$body.play()
