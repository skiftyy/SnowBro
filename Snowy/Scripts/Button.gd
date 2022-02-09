extends Button

func _ready():
	yield(get_tree().create_timer(0.6), "timeout")
	grab_focus()
