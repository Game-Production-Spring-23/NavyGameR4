extends Node2D

"""
	name: 5-3_minigame5.gd
	description: This script manages minigame 5
"""
@onready var textureRect = $UI/Background
@onready var gate1 = $UI/Background/gate1
@onready var gate2 = $UI/Background/gate2
@onready var gate3 = $UI/Background/gate3
@onready var toggle128 = $UI/Background/HBoxContainer/Toggle128/TextureButton
@onready var toggle64 = $UI/Background/HBoxContainer/Toggle64/TextureButton
@onready var toggle32 = $UI/Background/HBoxContainer/Toggle32/TextureButton
@onready var toggle16 = $UI/Background/HBoxContainer/Toggle16/TextureButton
@onready var toggle8 = $UI/Background/HBoxContainer/Toggle8/TextureButton
@onready var toggle4 = $UI/Background/HBoxContainer/Toggle4/TextureButton
@onready var toggle2 = $UI/Background/HBoxContainer/Toggle2/TextureButton
@onready var toggle1 = $UI/Background/HBoxContainer/Toggle1/TextureButton

var currentSum = 0
var solutions = [5, 120, 255]

var gateArray = []
var binarySequence = []

var step = 1

func _ready():
	for i in range(8):
		binarySequence.append(0)
	
	gateArray.append(gate1)
	gateArray.append(gate2)
	gateArray.append(gate3)

	for i in range(len(solutions)):
		gateArray[i].text = str(solutions[i])

	toggle128.toggled.connect(_on_button_toggled.bind(0));
	toggle64.toggled.connect(_on_button_toggled.bind(1));
	toggle32.toggled.connect(_on_button_toggled.bind(2));
	toggle16.toggled.connect(_on_button_toggled.bind(3));
	toggle8.toggled.connect(_on_button_toggled.bind(4));
	toggle4.toggled.connect(_on_button_toggled.bind(5));
	toggle2.toggled.connect(_on_button_toggled.bind(6));
	toggle1.toggled.connect(_on_button_toggled.bind(7));

func _on_button_toggled(button, button_index):
	if(button == true):
		binarySequence[button_index] = 1
	else:
		binarySequence[button_index] = 0
	calcBinary()

func calcBinary():
	var result = 0
	var power = binarySequence.size() - 1
	
	for bit in binarySequence:
		result += bit * pow(2, power)
		power -= 1

	print(result)
	if(step < 4 and result == solutions[step - 1]):
		step += 1
		gateArray[step - 2].self_modulate = Color8(255, 200, 87)
		textureRect.texture = load("res://assets/images/sprites/minigame_5/minigame5bg_step" + str(step) + ".png")

	if(step >= 4):
		finish_game()

func finish_game():
	gameController.changeScene("testEnd", "res://assets/audio/music/swamp-intro.ogg", "res://assets/audio/music/swamp-body.ogg")
