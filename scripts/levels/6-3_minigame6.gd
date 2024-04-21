extends Node2D

var isDragging = false
@onready var boxes = $EquationBoxes.get_children();
@onready var radar = $Radar/Line2D

func _on_submit_button_pressed():
	var pos = 1
	var correctEquation = true;
	for box in boxes:
		if(box.held):
			if(box.held.correctPos != pos):
				correctEquation = false
				box.held.reset()
				box.held = null
		else:
			correctEquation = false
		pos += 1
	if(correctEquation):
		end_minigame()

func end_minigame():
	radar.enableRadar()
	await get_tree().create_timer(3.0).timeout
	gameController.changeScene("6-4_dialogue", null, "res://assets/audio/music/city-body.ogg")
