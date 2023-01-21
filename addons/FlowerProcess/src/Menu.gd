tool
extends Panel

var start_node = load("res://addons/FlowerProcess/src/Node/Start.tscn")
var end_node = load("res://addons/FlowerProcess/src/Node/End.tscn")

onready var main = get_node("..")

func _on_AddStart_pressed():
	main.add_node(start_node)

func _on_AddEnd_pressed():
	main.add_node(end_node)
