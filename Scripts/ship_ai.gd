extends Ship
@onready var brain: NavigationAgent3D = $Brain
var Actions = {
	"Accelerate" : 0.0,
	"Turn Left" : 0.0,
	"Turn Right": 0.0,
	"Brake": 0.0
}
var flagShip: Ship = null
var FSForward: Vector3
var directionToFS: Vector3
var 
