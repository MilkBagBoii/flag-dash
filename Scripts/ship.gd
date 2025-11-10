extends CharacterBody3D
class_name Ship

@export var acceleration: float = 150
@export var deceleration: float = 50
@export var friction: float = 20
@export var max_speed: float = 100
@export var turn_speed: float = 5
@export var rotation_boost_curve: Curve
@onready var model: Node3D = $Model
@onready var splash_emitter: GPUParticles3D = $"Splash Emitter"



var holding_flag: bool = false
var held_time: float = 0

func _process(delta: float) -> void:
	print((floor(rotation_boost_curve.sample(velocity.length() / max_speed))))
	
	do_friction()
	check_velocity()
func _physics_process(delta: float) -> void:
	do_particals()
	move_and_slide()
func do_particals():
	if (velocity.length() > max_speed/2):
		splash_emitter.emitting = true
	else:
		splash_emitter.emitting = false




func accelerate_forward():
	velocity += -transform.basis.z * acceleration * get_process_delta_time()
	

func accelerate_backward():
	velocity += transform.basis.z * acceleration * get_process_delta_time()
	
func turn_right():
	rotate_y(-turn_speed * get_process_delta_time() / rotation_boost_curve.sample(velocity.length() / max_speed))
	
func turn_left():
	rotate_y(turn_speed * get_process_delta_time() / rotation_boost_curve.sample(velocity.length() / max_speed))
	
func brake():
	velocity -= velocity.normalized() * deceleration * get_process_delta_time()

func do_friction():
	if velocity.length() > 0:
		velocity -= velocity.normalized() * friction * get_process_delta_time()

func check_velocity():
	if velocity.length() > max_speed:
		velocity -= velocity * 2 * get_process_delta_time() 
