extends Node2D
@onready var player = $player
@onready var alien = $alien
var questions = [1,2,3,4,5,6,7]
var nextQuestion = 0 #the index of the current question

func _ready():
	question()

func question():
	nextQuestion = randi_range(0, questions.size() - 1)
	gameController.triggerDialogue("chapter1", "minigameQuestion" + str(questions[nextQuestion]))

func answer(correct):
	if(correct):
		questions.remove_at(nextQuestion)
		player.position.x += 100
		if(questions.size() == 0):
			print("done. you win. congrats")
		else:
			await get_tree().create_timer(2.0).timeout
			question()
	else:
		player.position.x -= 100
		await get_tree().create_timer(2.0).timeout
		question()

	
