extends CanvasLayer

var rect_size = 0.0
onready var start = false

func _ready():
	$SCORE.visible = false
	$ScoreCounter.visible = true
	$Container.visible = false
	start = false

func _physics_process(delta):
	if Globals.alive == false:
		$SCORE.visible = true
		$Container.visible = true
		$ScoreCounter.visible = false
		if start == false:
			$SCORE.set_text(str(Globals.score))
			for i in range(10):
				$SCORE.rect_scale = Vector2(rect_size, rect_size)
				yield(get_tree().create_timer(0.1), "timeout")
				rect_size += 0.0015
			start = true
			Globals.score = 0
	else:
		pass

func _on_Exit_button_up():
	$Audio.play()
	get_tree().change_scene("res://Levels/Menu.tscn")

func _on_Play_button_up():
	$Audio.play()
	get_tree().change_scene("res://Levels/World.tscn")
