extends CharacterBody3D

@export var acceleration: float = 25
@export var deceleration: float = 100
@export var max_speed: float = 100
@export var turn_boost: float = 3
@onready var model: Node3D = $Model
@onready var splash_emitter: GPUParticles3D = $"Splash Emitter"

var speed: float = 0
var max_roll: float = 20
var max_pitch: float = 10
var roll_speed: float = 60
var pitch_speed: float = 10
func _process(delta: float) -> void:
	do_particals()
	if (Input.is_action_pressed("ui_up")):
		if (speed < max_speed):
			speed = lerpf(speed, max_speed, acceleration * delta / 100)
			model.rotation_degrees.x -= pitch_speed * delta 
			model.rotation_degrees.x = clampf(model.rotation_degrees.x, -max_pitch,max_pitch)
	elif(Input.is_action_pressed("ui_down")):
		if (speed > -max_speed):
			speed = lerpf(speed, -max_speed, acceleration * delta / 100)
			model.rotation_degrees.x += pitch_speed * delta 
			model.rotation_degrees.x = clampf(model.rotation_degrees.x, -max_pitch,max_pitch)
	else:
		if (speed != 0):
			speed = lerpf(speed, 0, deceleration * delta / 100)
			model.rotation_degrees.x += pitch_speed * delta * sign(-model.rotation_degrees.x) 
			
	
	var boost = clamp(turn_boost * (max_speed - speed)/max_speed, 0,turn_boost)
	if (Input.is_action_pressed("ui_right")):
		rotate_y(-delta * boost)
		model.rotation_degrees.z += roll_speed * delta 
		model.rotation_degrees.z = clampf(model.rotation_degrees.z, -max_roll,max_roll)
	elif (Input.is_action_pressed("ui_left")):
		rotate_y(delta * boost)
		model.rotation_degrees.z -= roll_speed * delta 
		model.rotation_degrees.z = clampf(model.rotation_degrees.z, -max_roll,max_roll)
	else:
		model.rotation_degrees.z += roll_speed * delta * sign(-model.rotation_degrees.z) 
	velocity = -transform.basis.z * speed
	move_and_slide()
	
	
func do_particals():
	print(model.rotation_degrees.z)
	if(abs(speed) > 20):
		if (model.rotation_degrees.z < -5):
			splash_emitter.emitting = true
			splash_emitter.rotation_degrees.y = 0
		elif (model.rotation_degrees.z > 5):
			splash_emitter.emitting = true
			splash_emitter.rotation_degrees.y = 180
		else:
			splash_emitter.emitting = false
	else:
		splash_emitter.emitting = false
