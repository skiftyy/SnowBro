extends RigidBody

var size = Globals.rock_size / 80

func _ready():
	self.scale = Vector3(size, size, size)
	
func _physics_process(_delta):
	self.apply_central_impulse(Vector3(0, -1.5, 0))
	
func _process(_delta):
	if size > 0.1:
		size -= 0.03
		self.scale = Vector3(size, size, size)
	else:
		queue_free()
