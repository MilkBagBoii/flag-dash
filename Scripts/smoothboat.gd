extends Node3D

@export var interp_speed: float = 50
@onready var top: Node3D = $".."
func _ready() -> void:
	top_level = true
func _process(delta: float) -> void:
	var flat_pos = Vector3(top.global_position.x, global_position.y, top.global_position.z)
	global_position = lerp(global_position, flat_pos, interp_speed * delta / 2)
	global_rotation.y = top.global_rotation.y
