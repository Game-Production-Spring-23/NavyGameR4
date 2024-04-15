extends Line2D
"""
name: sineWave.gd
description: This script manages a sine wave for minigame 4

"""

var amplitude = 75
var frequency = 50
var speed = 1.5

var time = 0
var length = 0

func _ready():
	# Gets length of screen as wave length
	length = get_viewport_rect().size.x

func _process(delta):
	time += delta * speed
	clear_points()

	# Redraws the sine wave every frame
	for x in range(0, length):
		var y = amplitude * sin(((x - time )/ frequency) - (time * speed))
		add_point(Vector2(x, y))

func setAmplitude(a):
	amplitude = a * 15

func setFrequency(b):
	frequency = b * 10
