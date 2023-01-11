extends HBoxContainer

func _on_Hbox_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_node("../..").点击NPC()
