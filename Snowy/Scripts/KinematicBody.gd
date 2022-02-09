extends RigidBody

export var jump_strength := 0
var size = 3
export var max_size = 25

var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

onready var _model: Spatial = $Snowball

func _physics_process(delta: float) -> void:
	var move_direction := Vector3.ZERO
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
	
	if size < max_size:
		size += ((abs(move_direction.x) + abs(move_direction.z))) / 350
	
	self.friction = size / max_size
	
	self.apply_central_impulse(Vector3(move_direction.x, -2, move_direction.z) * delta * 100)

	if _velocity.length() > 0.2:
		var look_direction = Vector2(_velocity.z, _velocity.x)
		_model.rotation.y = look_direction.angle()

func _on_Timer_timeout():
	if size < max_size:
		size += 0.001
		self.scale = Vector3(size, size, size)
	else:
		pass

func _on_Snowball_body_entered(body):
	if body.is_in_group("Rock"):
		hit()

func hit():
	Globals.camera.shake(200)
	$Audio.play()
	for i in range(70):
		size -= 0.1
		yield(get_tree().create_timer(0.02), "timeout")
		if size < 1:
			Globals.alive = false
			if Globals.score > Globals.highscore:
				Globals.highscore = Globals.score
				Globals.save_highscore()
			print("ded")
			queue_free()
		else:
			pass

func _on_Spawn_timeout():
	Globals.player_loc_x = self.translation.x
	Globals.player_loc_z = self.translation.z
