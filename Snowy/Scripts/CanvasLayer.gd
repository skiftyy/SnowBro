extends CanvasLayer

func _ready():
	$Highscore.set_text("Highscore: " + str(Globals.highscore))

func _on_Exit_button_up():
	get_tree().quit()

func _on_Play_button_up():
	get_tree().change_scene("res://Levels/World.tscn")
