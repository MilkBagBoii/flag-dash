extends TextureRect
class_name  WarnArrow
@onready var target: Ship
@onready var camera: Camera3D


func PickTarget_PickCamera(Camera:Camera3D, Target:Ship):
	camera = Camera
	target = Target

func _process(delta: float) -> void:
	if target == null or camera == null:
		return

	var screen_pos = camera.unproject_position(target.global_position)
	var viewport = get_viewport().get_visible_rect().size

	var is_off_screen = (
		screen_pos.x < 0 or screen_pos.x > viewport.x or
		screen_pos.y < 0 or screen_pos.y > viewport.y
	)

	visible = is_off_screen
	if not visible:
		return

	# Clamp arrow position to edges
	var x = clamp(screen_pos.x, 50.0, viewport.x - 50.0)
	var y = clamp(screen_pos.y, 50.0, viewport.y - 50.0)

	position = Vector2(x, y)

	# Rotation
	var center = viewport / 2
	var dir = (screen_pos - center).normalized()
	rotation = dir.angle() #ADD THIS IF THE ARROW NATURALY LOOKS UP OR DOWN +  -deg_to_rad(90)
