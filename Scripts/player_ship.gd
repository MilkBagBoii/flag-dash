extends Ship


func _process(delta: float) -> void:
	if (Input.is_action_pressed("ui_accept")):
		brake()
	elif (Input.is_action_pressed("ui_up")):
		accelerate_forward()
	elif(Input.is_action_pressed("ui_down")):
		accelerate_backward()
	
	
	if (Input.is_action_pressed("ui_right")):
		turn_right()
	elif  (Input.is_action_pressed("ui_left")):
		turn_left()
		
	super._process(delta)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
