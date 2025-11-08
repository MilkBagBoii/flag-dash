extends Ship


func _physics_process(delta: float) -> void:
	do_particals()
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
	calc_model_transform(delta)
	
	
	angular_damp = clamp(max_ang_damp * (linear_velocity.length() / max_speed), 0, max_ang_damp)
