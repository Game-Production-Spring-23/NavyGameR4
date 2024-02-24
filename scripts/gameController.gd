extends Node

var textSpeed = 100
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer

func changeScene(scenePath, intro = null, body = null):
	#play the fade out animation, then switch scene and fade back in
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/" + scenePath + ".tscn")
	animationPlayer.play_backwards("Fade")
	#checks if the changeScene() call provides both music paths, plays it if yes and simply pauses it if not
	if(intro and body):
		changeMusic(intro, body)
	else:
		pauseMusic()

#takes two resource paths, sets the music components to those and plays the intro portion again
func changeMusic(intro, body):
	#haven't actually tested to make sure the audio pauses when changed but just in case it doesn't
	pauseMusic()
	$music/intro.stream = intro
	$music/body.stream = body
	playMusic()

#slightly inelegant - possible to take the playback time when it is paused and pass it back in to start at the time it was paused
func playMusic():
	$music/intro.play()

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

func triggerDialogue(path, dialogName) :
	DialogueManager.show_dialogue_balloon(load("res://dialogue/"+path + "/main.dialogue"), dialogName)
