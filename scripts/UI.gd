extends Control
var pic = 1
@onready var image1 = preload("res://assets/images/Fauna_Concept1.png")
@onready var image2 = load("res://assets/images/astronaut.png")

func _on_button_pressed():
	if(pic == 1):
		pic += 1
		$ImageTest/Image.texture = image2
	else:
		pic -= 1
		$ImageTest/Image.texture = image1

func _on_sound_button_pressed():
	$SoundTest/SoundPlayer.play()
	$SoundTest/soundText.text = "Sound is\nPlaying"

func _on_sound_player_finished():
	$SoundTest/soundText.text = "Sound is\nnot Playing"
