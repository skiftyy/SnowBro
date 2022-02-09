extends Node

var music = load("res://Sounds/Background.wav")

func _ready():
	if Globals.music == true:
		play_music()
		Globals.music = false

func play_music():
	$Audio.stream = music
	$Audio.play()
