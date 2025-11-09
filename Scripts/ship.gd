extends RigidBody3D
class_name Ship

@export var acceleration: float = 200
@export var deceleration: float = 25
@export var max_speed: float = 100
@export var turn_speed: float = 15
@onready var model: Node3D = $Model
@onready var splash_emitter: GPUParticles3D = $"Splash Emitter"

var max_ang_damp:float = 5
var prev_lin: Vector3
var prev_ang: Vector3
func _physics_process(delta: float) -> void:
	if (linear_velocity.length() <= 0.2):
		gravity_scale = 0
	else:
		gravity_scale = 1
	do_particals()
	calc_model_transform(delta)
	angular_damp = clamp(max_ang_damp * (linear_velocity.length() / max_speed), 0, max_ang_damp)
func do_particals():
	if (linear_velocity.length() > max_speed/2):
		splash_emitter.emitting = true
	else:
		splash_emitter.emitting = false


func calc_model_transform(delta):
	
	var change_lin: Vector3 = linear_velocity - prev_lin
	var change_ang: Vector3 = angular_velocity - prev_ang

	var forward := -model.global_transform.basis.z

	var x := 0.0
	var mag := change_lin.length()
	if mag > 0.0001:
		var change_dot: float = (change_lin / mag).dot(forward)
		x = mag * change_dot * 15

	print(change_ang.y)

	model.rotation_degrees = lerp(model.rotation_degrees,Vector3(x, model.rotation_degrees.y, change_ang.y * 500), delta)

	prev_lin = linear_velocity
	prev_ang = angular_velocity
