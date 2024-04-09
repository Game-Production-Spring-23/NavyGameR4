extends Area2D

"""
	name: playerTrigger.gd
	description: This script controls an trigger that calls once and must be interacted with the 'e' key
"""
signal player_interact
var hasPlayerInteracted
var isPlayerWithinRange
var playerRef

# Called when the node enters the scene tree for the first time.
func _ready():
	hasPlayerInteracted = false
	isPlayerWithinRange = false
	body_entered.connect(Callable(self, "_on_body_entered"))
	body_exited.connect(Callable(self, "_on_body_exit"))

# If a 2Dbody has entered the area
func _on_body_entered(body):
	# Only check if the player hasn't interacted with the trigger before
	if (!hasPlayerInteracted):
		if body.name == "Player":
			# Gets player reference for the first time
			if(playerRef == null):
				playerRef = body 
			isPlayerWithinRange = true
			body.showInteractionPrompt(true)

# If a 2Dbody has exit the area
func _on_body_exit(body):
	# Only check if the player hasn't interacted with the trigger before
	if (!hasPlayerInteracted):
		if body.name == "Player":
			isPlayerWithinRange = false
			body.showInteractionPrompt(false)

# Handles player's input
func _input(event):	
	# If the player is within range, hasn't interacted with this trigger before and presses 'e'
	if(isPlayerWithinRange && !hasPlayerInteracted && playerRef != null && event.is_action_pressed("interact")):
		print("interact")
		hasPlayerInteracted = true
		playerRef.showInteractionPrompt(false)
		player_interact.emit()



func _on_player_interact():
	gameController.triggerDialogue("chapter1", "tutorial4")
