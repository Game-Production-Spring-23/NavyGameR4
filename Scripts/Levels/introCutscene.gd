extends Node2D

"""
	name: introCutscene.gd
	description: This script manages the intro cutscene and loads the intro dialouge afterwards

"""
#		FUNCTIONS
# Called whenever a key is pressed.
func _input(event):
	# Check if the event is a key press event and if it's the space bar
	if event.is_action_pressed("ui_accept"): # Change "ui_accept" to whatever action you're using for space bar
		# Call the finished function immediately
		_on_video_stream_player_finished()

# Switches to intro dialouge as soon as intro cutscene finishes
func _on_video_stream_player_finished():
	gameController.changeScene("2characterCreation")
