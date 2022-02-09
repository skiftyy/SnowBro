extends Spatial

onready var Rock = preload("res://Objects/Rock.tscn")
var speed = 0.7

func _ready():
	$Timer.wait_time = 0.5
	$Timer.start()

func timing():
	$Timer.wait_time = rand_range(speed-0.1, speed+0.1)
	$Timer.start()

func _on_Timer_timeout():
	var rock = Rock.instance()
	rock.translation = Vector3(rand_range(-120, 120), 35, rand_range(-120, 120))
	self.add_child(rock)
	$Timer.stop()
	timing()
