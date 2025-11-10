extends Camera3D


@export var interp_speed: float = 25
@export var offset: Vector2 = Vector2(5,15)
@onready var top: Node3D = $"../Model"
var relative_position
func _ready() -> void:
	relative_position = (global_position - top.global_position)
func _process(delta: float) -> void:
	var flat_pos = top.global_position + relative_position
	global_position = lerp(global_position, flat_pos, interp_speed * delta)

	
	
