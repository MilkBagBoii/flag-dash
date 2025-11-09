extends Node3D

var holder: Node3D = null
var interp_speed: float = 10
var grab_cd: float = 5
var cur_cd: float = 0

func _process(delta: float) -> void:
	if (cur_cd > 0):
		cur_cd -= delta
	if (holder != null):
		global_position = lerp(global_position, holder.global_position, delta * interp_speed)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if (cur_cd > 0.01): return
	if (body is Ship): 
		holder = body
		cur_cd = grab_cd
	pass # Replace with function body.
