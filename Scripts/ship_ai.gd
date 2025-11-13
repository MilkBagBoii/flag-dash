extends Ship
@onready var brain: NavigationAgent3D = $Brain
var Actions = {
	"Accelerate" : 0.0,
	"Turn Left" : 0.0,
	"Turn Right": 0.0,
	"Brake": 0.0,
	"Uturn" : 0.0
}
var flagNode : Flag = null
var flagShip: Ship = null
var FSLocation : Vector3
var FSForward: Vector3
var directionToFS: Vector3
var distanceToFS: float
var angleToFS: float
var shipForward: Vector3

func _ready() -> void:
	flagNode = get_tree().get_root().get_node("Flag")
	
	pass
func _process(delta: float) -> void:
	gatherInfo()
	print(angleToFS)
	pass

func gatherInfo():
	flagShip = Game_Manager.current_holder
	if flagShip == null:
		return
	FSLocation = flagShip.global_position
	FSForward = -flagShip.global_transform.basis.z
	directionToFS = (-global_transform.basis.z - FSLocation).normalized()
	distanceToFS = (global_position - FSLocation).length()
	shipForward = -global_transform.basis.z
	var dot = shipForward.dot(FSLocation)
	angleToFS = rad_to_deg(acos(dot))

func TurnToFlagShip():
	pass
