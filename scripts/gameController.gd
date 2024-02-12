extends Node

var textSpeed = 1
@onready var animationPlayer = $ScreenTransition/FadeScreen/AnimationPlayer

func changeScene(scenePath, intro = null, body = null):
	#play the fade animation
	animationPlayer.play("Fade")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/" + scenePath + ".tscn")
	animationPlayer.play_backwards("Fade")
	#change music
	if(intro and body):
		changeMusic(intro, body)
	else:
		pauseMusic()

func changeMusic(intro, body):
	$music/intro.stream = intro
	$music/body.stream = body
	$music/intro.play()
	
func pauseMusic():
	#sets both the intro and body to pause
	$music/intro.stream_paused = true
	$music/body.stream_paused = true
