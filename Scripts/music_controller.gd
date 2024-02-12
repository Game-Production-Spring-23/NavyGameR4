extends Node

@export var introSong: Resource
@export var bodySong: Resource


func _ready():
	$intro.stream = introSong
	$body.stream = bodySong
	$intro.play()


func _process(delta):
	pass


func _on_intro_finished():
	$body.play()
