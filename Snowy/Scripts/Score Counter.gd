extends RichTextLabel

func _on_Timer_timeout():
	if Globals.alive == true:
		Globals.score += 1
		self.set_text("Score: " + str(Globals.score))
