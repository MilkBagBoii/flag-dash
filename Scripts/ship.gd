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
var points: int = 0
var boatName : String
var time_accumulation : float = 0

func _process(delta: float) -> void:
	#print((floor(rotation_boost_curve.sample(velocity.length() / max_speed))))
	
	do_friction()
	check_velocity()
	check_if_holding_flag()
func _physics_process(delta: float) -> void:
	do_particals()
	move_and_slide()
func do_particals():
	if (velocity.length() > max_speed/2):
		splash_emitter.emitting = true
	else:
		splash_emitter.emitting = false

func check_if_holding_flag():
	if Game_Manager.current_holder == self:
		holding_flag = true
		held_time += get_process_delta_time()
	else:
		holding_flag = false

func check_to_gain_Points():
	if holding_flag == true:
		accumulate_time()
	else:
		time_accumulation = 0

func accumulate_time():
	time_accumulation += get_process_delta_time()
	if time_accumulation >= 1:
		time_accumulation = 0 
		gain_points()

func gain_points():
	points += 100
	print(points)

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
