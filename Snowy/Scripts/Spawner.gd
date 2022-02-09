extends Node

onready var Rock = preload("res://Objects/Rock.tscn")
var speed = 0.8

func _ready():
	$Timer.wait_time = 2
	$Timer.start()

func timing():
	$Timer.wait_time = rand_range(speed-0.1, speed+0.1)
	$Timer.start()

func _on_Timer_timeout():
	var rock = Rock.instance()
	rock.translation = Vector3(rand_range(-120, 120), 35, rand_range(-120, 120))
	self.add_child(rock)
	$Timer.stop()
	if speed > 0.5:
		speed -= 0.02
	timing()
	

func _on_Spawn_timeout():
	var power_rock = Rock.instance()
	power_rock.translation = Vector3(Globals.player_loc_x, 50, Globals.player_loc_z)
	self.add_child(power_rock)

