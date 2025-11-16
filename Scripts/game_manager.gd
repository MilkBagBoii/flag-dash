extends Node

var leader_board: Array[Ship]
const FLAG = preload("uid://daducu2je0iv5")
var current_holder: Node3D = null
var flag: Node3D: 
	get():
		return get_tree().get_first_node_in_group("Flag") 
