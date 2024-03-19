extends Area2D

"""
	name: areaTrigger.gd
	description: This script controls an trigger that calls once and must be interacted by entering the area
"""
signal player_interact
var hasPlayerInteracted
@export var mulipleInteracts: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	hasPlayerInteracted = false
	body_entered.connect(Callable(self, "_on_body_entered"))

# If a 2Dbody has entered the area
func _on_body_entered(body):
	# Only check if the player hasn't interacted with the trigger before
	if (!hasPlayerInteracted || mulipleInteracts):
		if body.name == "Player":
			hasPlayerInteracted = true
			player_interact.emit()



