extends Camera2D

@export var tilemap: TileMap

func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.rendering_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right = 5 * (worldSizeInPixels.x)
	limit_bottom = 5 * (worldSizeInPixels.y)
	limit_left = 0
	limit_top = 0


func _process(delta):
	pass
