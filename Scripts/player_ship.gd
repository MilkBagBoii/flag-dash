extends Ship


func _physics_process(delta: float) -> void:
	if (Input.is_action_pressed("ui_up") && linear_velocity.length() < max_speed):
		apply_force(-transform.basis.z * acceleration)
	if(Input.is_action_pressed("ui_down") && linear_velocity.length() < max_speed):
		apply_force(transform.basis.z * acceleration)
	
	if (Input.is_action_pressed("ui_accept")):
		pass
	if (Input.is_action_pressed("ui_right")):
		apply_torque(Vector3.UP * -turn_speed)
	elif  (Input.is_action_pressed("ui_left")):
		apply_torque(Vector3.UP * turn_speed)
	super._physics_process(delta)
	
