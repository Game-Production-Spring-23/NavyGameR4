extends Control

@onready var texture_rect = $TextureRect

func _get_drag_data(_at_position):
	set_drag_preview(get_preview())
	return texture_rect

func _can_drop_data(_pos, data):
	return data is TextureRect
	
func _drop_data(_pos, data):
	var tempTexture = texture_rect.texture
	var tempPos = texture_rect.correctPos

	texture_rect.texture = data.texture
	texture_rect.correctPos = data.correctPos

	data.texture = tempTexture
	data.correctPos = tempPos

# Creates a preview of the draggable texture
func get_preview():
	var preview_texture = TextureRect.new()

	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(100, 100)

	var preview = Control.new()
	preview.add_child(preview_texture)

	return preview

# extends Area2D

# @onready var main = get_tree().root.get_node("6-3Minigame6")
# @onready var originalPos = position;
# @export var correctPos : int # set -1 to indicate it has no correct position
# var draggable = false
# var insideDroppable = false
# var bodyRef # where the 'droppable' body is stored
# var offset : Vector2

# func _process(_delta):
# 	if draggable:
# 		if Input.is_action_just_pressed("click"):
# 			offset = get_global_mouse_position() - global_position
# 			main.isDragging = true
# 		if Input.is_action_pressed("click"):
# 			var new_position = get_global_mouse_position() - offset
# 			if is_position_valid(new_position):
# 				global_position = new_position
# 				if(bodyRef):
# 					bodyRef.held = null
# 		elif Input.is_action_just_released("click"):
# 			main.isDragging = false
# 			if insideDroppable:
# 				if(!bodyRef.held): #ensure there isn't something already in the square
# 					if is_position_valid(global_position):
# 						var tween = get_tree().create_tween()
# 						bodyRef.held = self
# 						tween.tween_property(self, "position", bodyRef.position, 0.2).set_ease(Tween.EASE_OUT)
# 					else:
# 						reset()
# 				else:
# 					reset()

# func is_position_valid(new_position):
# 	var bodies = get_overlapping_bodies()
# 	for body in bodies:
# 		if body.is_in_group("draggable"):
# 			return false
# 	return true

# func _on_mouse_entered():
# 	if !main.isDragging:
# 		draggable = true
# 		scale = Vector2(1.05, 1.05)

# func _on_mouse_exited():
# 	if !main.isDragging:
# 		draggable = false
# 		scale = Vector2(1, 1)

# func _on_body_entered(body):
# 	if body.is_in_group("droppable"):
# 		insideDroppable = true
# 		bodyRef = body

# func _on_body_exited(body):
# 	if body.is_in_group("droppable"):
# 		insideDroppable = false

# func reset():
# 	var tween = get_tree().create_tween()
# 	insideDroppable = false;
# 	tween.tween_property(self, "position", originalPos, 0.2).set_ease(Tween.EASE_OUT)
	
