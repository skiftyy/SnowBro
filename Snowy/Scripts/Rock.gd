extends RigidBody

onready var Split = preload("res://Objects/SplitRock.tscn")
var node = Spatial.new()

func _ready():
	self.scale = Vector3(Globals.rock_size, Globals.rock_size, Globals.rock_size)
	self.apply_central_impulse(Vector3(rand_range(-6,6), 0, rand_range(-6,6)))
	
func _physics_process(delta):
	self.apply_central_impulse(Vector3(0, rand_range(-2, -8), 0))

func _on_Rock_body_entered(body):
	if body.is_in_group("Floor"):
		var split = Split.instance()
		split.translation.x = self.translation.x
		#split.translation.y = self.translation.y
		split.translation.z = self.translation.z
		get_tree().get_root().add_child(split)
		queue_free()

func _on_Timer_timeout():
	var split = Split.instance()
	split.translation.x = self.translation.x
	#split.translation.y = self.translation.y
	split.translation.z = self.translation.z
	get_tree().get_root().add_child(split)
	queue_free()
