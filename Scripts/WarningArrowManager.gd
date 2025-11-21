extends Control
var Camera : Camera3D
var AShips : Array = [Ship]
@onready var WarningArrow: = preload("res://Scene/ControlScenes/WarningArrow.tscn")

func _ready() -> void:
	Camera = get_tree().get_first_node_in_group("Camera")
	AShips = get_tree().get_nodes_in_group("Ships")
	CreateArrows()
	
func CreateArrows():
	if  AShips == null:
		return
	for IShip in AShips:
		var Arrow = WarningArrow.instantiate()
		if Arrow is WarnArrow:
			Arrow.PickTarget_PickCamera(Camera,IShip)
		add_child(Arrow)
	pass
