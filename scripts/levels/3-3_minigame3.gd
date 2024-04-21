extends Node2D

@onready var tilemap = $TileMap
@onready var background = $Background

var solution = [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2)]
var guess = [Vector2i(1, 0), Vector2i(2, 0), Vector2i(0, 0), Vector2i(0, 1), Vector2i(2, 1), Vector2i(1, 1), Vector2i(2, 2), Vector2i(1, 2), Vector2i(0, 2)]
var isGameComplete = false
"""
	name: 3-3_minigame3.gd
	description: This script manages minigame 3

"""

func _ready():
	# Display how to play dialogue here?
	# gameController.triggerDialogue("chapter3", "chapter3_4")
	# scramble_puzzle()
	display_board()

# Displays the board
func display_board():
	var positionIndex = 0;

	for cell in guess:
		tilemap.set_cell(0, solution[positionIndex], 1, cell)
		positionIndex += 1

# Function to shuffle the array of arrays
func scramble_puzzle():
	guess.shuffle()

# Allows the user to click on a tile with the correct board
func _input(event):
	if event is InputEventMouseButton:
		if(isGameComplete == false):
			var pos = tilemap.get_local_mouse_position()
			var tile_pos = tilemap.local_to_map(pos)
			if event.pressed:
				if(solution.has(tile_pos)):
					swap_tiles(tile_pos)

# Swaps the tile withe the clicked tile
func swap_tiles(pos):
	var empty_tile_pos = solution[guess.find(Vector2i(2, 2))]

	# Calculate the Manhattan distance between the current tile and the empty tile
	var distance = abs(pos.x - empty_tile_pos.x) + abs(pos.y - empty_tile_pos.y)

	# Check if the current tile is adjacent to the empty tile
	if distance == 1:
		# Perform the swap
		var temp = guess[solution.find(pos)]
		guess[solution.find(pos)] = guess[solution.find(empty_tile_pos)]
		guess[solution.find(empty_tile_pos)] = temp

		display_board()  # Update the board after swapping

		# If the user guesses correctly
		if(guess == solution):
			tilemap.hide()
			background.texture = load("res://assets/images/sprites/minigame_3/minigame_3_background_complete.png")
			isGameComplete = true
			gameController.triggerDialogue("chapter3", "chapter3_4")

func finish_game():
	await get_tree().create_timer(3.0).timeout
	gameController.changeScene("3-4_dialogue", "res://assets/audio/music/mountain-intro.ogg", "res://assets/audio/music/mountain-body.ogg")
