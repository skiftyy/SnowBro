extends Node

var camera = null
onready var alive = true
onready var rock_size = 400
var player_loc_x = 0
var player_loc_z = 0
onready var score = 0
var highscore = 0
var music = true

const SAVE_FILE_PATH = "user://savedata.save"

func _ready():
	load_highscore()

func _physics_process(delta):
	if rock_size < 2000:
		rock_size += 0.15

func save_highscore():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(highscore)
	save_data.close()
	print("Score Saved")

func load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		highscore = save_data.get_var()
		save_data.close()
