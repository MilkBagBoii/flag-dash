extends Control
class_name UserBar

var Name: String = ("Boat")
var Score: int
var shipref: Ship
@export var NLabel : Label 
@export var SLabel : Label 

func  _ready() -> void:
	#var leaderboard_Container = get_tree().get_first_node_in_group("leaderboard_container")
	#if leaderboard_Container:
	#	leaderboard_Container.add_child(self)
	#else: print("Leaderboard container is not found")
	pass

func _process(delta: float) -> void:
	UpdateText()
	pass

func UpdateText():
	if shipref:
		SLabel.text = str(shipref.points)
pass
func Build_User_Bar(TheShip:Ship):
	shipref = TheShip
	NLabel.text = str(shipref.name)
	pass
