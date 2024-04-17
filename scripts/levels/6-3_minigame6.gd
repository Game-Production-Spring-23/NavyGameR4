extends Node2D

var isDragging = false
@onready var boxes = $EquationBoxes.get_children();

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
		gameController.changeScene("6-4_dialogue")
