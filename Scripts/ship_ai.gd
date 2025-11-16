extends Ship
@onready var brain: NavigationAgent3D = $Brain

var Accelerate: float = 0.0
var Reverse: float = 0.0
var TurnLeft: float = 0.0
var TurnRight: float = 0.0
var Brake: float = 0.0
var should_start = false
func _process(delta: float) -> void:
	
	#this for testing
	if (Input.is_action_just_pressed("ui_page_up")):
		should_start = true
	if (should_start == false):
		return
	#end testing
	
	clear_weights()
	
	#checks go here
	want_flag()
	
	
	
	
	
	
	
	#end checks
	
	determine_action()
	super._process(delta)
func determine_action():
		if (Brake > Accelerate):
			if (Brake > Reverse):
				brake()
			else:
				accelerate_backward()
		else:
			accelerate_forward()
			
		if (TurnLeft > TurnRight):
			turn_left()
		else:
			turn_right()
func clear_weights():
	Accelerate = 0.0
	Brake = 0.0
	TurnLeft = 0.0
	TurnRight = 0.0

func want_flag():
	
	var target: Node3D
	
	if (Game_Manager.current_holder != null):
		target = Game_Manager.current_holder
	elif (Game_Manager.flag != null):
		target = Game_Manager.flag
	else:
		return
		
	if (Game_Manager.current_holder == self):
		return
	
	
	var forward: Vector3   = -global_transform.basis.z.normalized()
	var to_target: Vector3 = (target.global_position - global_transform.origin).normalized()
	forward.y = 0
	to_target.y = 0
	forward = forward.normalized()
	to_target = to_target.normalized()
	var cross: Vector3 = forward.cross(to_target)
	var dot: float = forward.dot(to_target)
	var angle: float = atan2(cross.y, dot) 
	if (angle < 0):
		TurnRight += 0.5
		TurnLeft -= 0.5
	elif (angle > 0):
		TurnRight -= 0.5
		TurnLeft += 0.5
	if (true):
		if (rad_to_deg(angle) < 45 || rad_to_deg(angle) > -45):
			Reverse -= 0.5
			Accelerate += 0.5
		elif (rad_to_deg(angle) > 45 || rad_to_deg(angle) < -45):
			Reverse += 0.5
			Accelerate -= 0.5
		if (abs(rad_to_deg(angle)) > 15):
			Brake += 0.8


func i_got_it():
	
	if (Game_Manager.current_holder != self):
		return
		
		
	
	
