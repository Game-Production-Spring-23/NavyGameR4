extends Node2D

"""
	name: 4-3_minigame4.gd
	description: This script manages minigame 4
"""
@onready var player_wave = $UI/Attempt
@onready var soultion_wave = $UI/Solution
@onready var a_knob = $UI/aKnob
@onready var b_knob = $UI/bKnob

var guess = [8, 2]
var solution = [4, 7]

var maxTurn = 18

func _ready():
	soultion_wave.setAmplitude(solution[0])
	soultion_wave.setFrequency(solution[1])
	display_knobs()

# Displays the knob at the positions
func display_knobs():
	a_knob.rotation_degrees = fmod(20 * guess[0], 360)
	b_knob.rotation_degrees = fmod(20 * guess[1], 360)
	player_wave.setAmplitude(guess[0])
	player_wave.setFrequency(guess[1])

	if(guess == solution):
		finish_game() 

func _on_knob_a_pressed():
	guess[0] += 1
	if(guess[0] > maxTurn):
		guess[0] = 1
	display_knobs()

func _on_knob_b_pressed():
	guess[1] += 1
	if(guess[1] > 8):
		guess[1] = 1
	display_knobs()

func finish_game():
	gameController.changeScene("4-4_dialogue", "res://assets/audio/music/desert-intro.ogg", "res://assets/audio/music/desert-body.ogg")
