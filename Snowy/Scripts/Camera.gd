extends Camera

onready var shakeTimer = $Timer
onready var tween = $Tween

var shake_amount = 0
var default_offset_h = h_offset

func _ready():
	Globals.camera = self
	set_process(false)

func _process(delta):
	h_offset = rand_range(-shake_amount, shake_amount) * delta + default_offset_h
	if shake_amount > 0:
		shake_amount -= 0.5

func shake(new_shake, shake_time = 0.5):
	if shake_amount < 500:
		shake_amount += new_shake
	shakeTimer.wait_time = shake_time
	tween.stop_all()
	set_process(true)
	shakeTimer.start()

func _on_Timer_timeout():
	shake_amount = 0
	set_process(false)
	tween.interpolate_property(self, "offset", h_offset, default_offset_h, 1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
