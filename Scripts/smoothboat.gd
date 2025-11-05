extends Node3D

@export var interp_speed: float = 25
@export var offset: Vector2 = Vector2(5,10)
@onready var top: Node3D = $".."

func _process(delta: float) -> void:
	var flat_pos = Vector3(top.global_position.x + offset.x, global_position.y, top.global_position.z + offset.y)
	global_position = lerp(global_position, flat_pos, interp_speed * delta)
	global_rotation.y = top.global_rotation.y
