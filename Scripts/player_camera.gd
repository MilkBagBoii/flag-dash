extends Camera3D


@export var interp_speed: float = 25
@export var offset: Vector2 = Vector2(0,4)
@onready var top: Node3D = $"../Model"

func _process(delta: float) -> void:
	var dir_to_top = (top.global_position - global_position).normalized()
	var behind_top = top.global_transform.basis.z.normalized() * offset.y + top.global_position
	var flat_pos = Vector3(behind_top.x,top.global_position.y + 2.5, behind_top.z)
	global_position = lerp(global_position, flat_pos, interp_speed * delta)
	if (dir_to_top.angle_to(-top.transform.basis.z) < 45):
		quaternion = quaternion.slerp(top.quaternion, delta * interp_speed / 4)
	
	
