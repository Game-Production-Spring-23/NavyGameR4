extends Node2D
@onready var radar = $Radar/Line2D
var tiles
var originalTiles = []

var currentConfig = [0, 0, 0, 0, 0]
var correctConfig = [1, 2, 3, 4, 5]

func _ready():
	tiles = get_tree().get_nodes_in_group("m6_position")

	for tile in tiles:
		originalTiles.append(tile.duplicate())

func _on_submit_button_pressed():
	# Gets currentConfig
	for i in range(currentConfig.size()):
		currentConfig[i] = tiles[i].correctPos

	if currentConfig != correctConfig:
		for i in range(tiles.size()):
			# Check if the tile is incorrectly placed
			if(i < correctConfig.size()):
				if(currentConfig[i] != correctConfig[i]):
					tiles[i].correctPos = originalTiles[i].correctPos
					tiles[i].texture = originalTiles[i].texture
			else:
				if(originalTiles[i].correctPos > 0):
					if(!isCorrectTileInCorrectPosition(originalTiles[i].correctPos)):
						tiles[i].correctPos = originalTiles[i].correctPos
						tiles[i].texture = originalTiles[i].texture
				else:
					tiles[i].correctPos = originalTiles[i].correctPos
					tiles[i].texture = originalTiles[i].texture
	else:
		end_minigame()

func isCorrectTileInCorrectPosition(pos):
	return currentConfig[pos - 1] == pos

func end_minigame():
	radar.enableRadar()
	await get_tree().create_timer(3.0).timeout
	gameController.changeScene("6-4_dialogue", null, "res://assets/audio/music/city-body.ogg")
