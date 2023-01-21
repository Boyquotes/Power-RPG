tool
extends Control

onready var menu = $Menu
onready var node2d = $Node2D
onready var graph = $Vbox/GraphEdit

var init_pos:Vector2 = Vector2(100, 100)
var now_index:int = 0

func _ready():
	menu.hide()

func add_node(node):
	var new_node = node.instance()
	graph.add_child(new_node)
	
	new_node.offset = node2d.to_local(init_pos + (now_index * Vector2(30, 30)))
	new_node.title = "Node" + str(now_index)
	now_index += 1

func _on_GraphEdit_popup_request(position):
	menu.set_position(node2d.to_local(position))
	menu.show()

func _on_GraphEdit_gui_input(event):
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_LEFT:
				menu.hide()

func _on_del_pressed():
	del_all_child(graph)

func del_all_child(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
