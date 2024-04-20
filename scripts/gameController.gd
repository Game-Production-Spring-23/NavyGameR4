extends Node
#Variable to define the textSpeed.
var textSpeed = 1
@onready var player = oPlayer.new(["she", "her", "hers"], "voice1", "purple")
var characterCanMove = true
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer
var busIndex = AudioServer.get_bus_index("Music")

var chapterSelect
var chapterIntro
var chapterBody

func _ready():
	#set music volume lower
	AudioServer.set_bus_volume_db(busIndex,-15)

func changeScene(scenePath, intro = null, body = null):
	#play the fade out animation, then switch scene and fade back in
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/levels/" + scenePath + ".tscn")
	animationPlayer.play_backwards("Fade")
	#checks if the changeScene() call provides both music paths or at least the body, plays it if yes and simply pauses it if not
	if(intro and body):
		changeMusic(intro, body)
	elif(body):
		changeMusic(intro, body)
	else:
		pauseMusic()

func setChangeChapter(select, intro =  null, body = null):
	chapterSelect = select
	chapterIntro = intro
	chapterBody = body

func changeChapter():
	#play the fade out animation, then switch scene and fade back in
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/levels/" + chapterSelect + ".tscn")
	animationPlayer.play_backwards("Fade")
	#checks if the changeScene() call provides both music paths or at least the body, plays it if yes and simply pauses it if not
	if(chapterIntro and chapterBody):
		changeMusic(chapterIntro, chapterBody)
	elif(chapterBody):
		changeMusic(chapterIntro, chapterBody)
	else:
		pauseMusic()

#takes two resource paths, sets the music components to those and plays the intro portion again
func changeMusic(intro, body):
	#haven't actually tested to make sure the audio pauses when changed but just in case it doesn't
	pauseMusic()
	if(intro):
		$music/intro.stream = load(intro)
	if(body):
		$music/body.stream = load(body)

	#if intro is present, play it. If not, play body instead
	if (intro):
		playIntro()
	else:
		playBody()
	

#slightly inelegant - possible to take the playback time when it is paused and pass it back in to start at the time it was paused
func playIntro():
	$music/intro.play()

func playBody():
	$music/body.play()

#sets both the intro and body music players to pause
func pauseMusic():
	$music/intro.stream_paused = true
	$music/body.stream_paused = true

#takes the path to create a new audioplayer node, which will remove itself upon completion
func playSound(path):
	var sound = AudioStreamPlayer.new()
	sound.set_stream(load(path))
	sound.finished.connect(func(): sound.queue_free())
	$soundQueue.add_child(sound)
	sound.play()

#takes the folder path and dialogue name, and triggers a dialogue balloon with those parameters.
func triggerDialogue(path, dialogName):
	characterCanMove = false
	DialogueManager.show_dialogue_balloon(load("res://dialogue/"+ path + "/main.dialogue"), dialogName)

func rootCall(function, parameter):
	#calls a method in the root node of the current scene (with an optional single parameter. i hate that this has to exist
	#if you don't have a parameter, pass in null
	if(parameter != null):
		get_tree().get_current_scene().call(function, parameter)
	else:
		get_tree().get_current_scene().call(function)

#MINIGAME 2 SPECIFIC CODE vvvv
#Triggers the click timing minigame in minigame 2 (Triggered after certain dialogs)
func triggerMinigame2():
	get_tree().get_current_scene().get_node("/root/minigame2").barAppear()

#Triggers minigame 2 answer function from dialog
func minigame2Answer(correct):
	get_tree().get_current_scene().get_node("/root/minigame2").answer(correct)
