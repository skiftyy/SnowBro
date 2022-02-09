extends Button

func _input(event):
	if event.is_action("Spam"):
			grab_focus()
			print("grabbed")
