extends CharacterBody2D
#parameters/idle/blend_position

@export var move_speed : float = 500
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var interactPrompt
var playerSprite

func _ready():
	# Gets and hides interactPrompt
	interactPrompt = get_node("IntractionPrompt")
	interactPrompt.hide()
	
	# Changes player's color scheme on start
	playerSprite = get_node("Sprite2D")
	if(gameController.player != null):
		playerSprite.texture = load("res://assets/images/spritesheets/player-walkall-"+gameController.player.color+".png")
	else:
		playerSprite.texture = load("res://assets/images/spritesheets/player-walkall-purple.png");


	update_animation_parameters(starting_direction)

func showInteractionPrompt(shouldShow):
	if(shouldShow):
		interactPrompt.show()
	else:
		interactPrompt.hide()

func _physics_process(_delta):
	if gameController.characterCanMove == true:
		#Get input direction
		var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)

		update_animation_parameters(input_direction)	

		#update velocity
		velocity = input_direction.normalized() * move_speed

		# move and slide
		move_and_slide()
		pick_new_state()


func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/walk/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)


func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")
