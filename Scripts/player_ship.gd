extends Ship
@onready var speed_bar: TextureProgressBar = $Control/ColorRect/SpeedBar
@onready var point_text: Label = $Control/ColorRect/Points/Point_Text


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
	speed_bar.value = velocity.length() / max_speed
	point_text.text = "Points: " + str(points)
	super._process(delta)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
