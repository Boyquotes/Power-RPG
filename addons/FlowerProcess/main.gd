tool
extends EditorPlugin

const MainPanel = preload("res://addons/FlowerProcess/src/Process.tscn")
var main_panel_instance

func _enter_tree():
	main_panel_instance = MainPanel.instance()
	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	make_visible(false)
	add_custom_type("FlowerProcess", "Node", preload("res://addons/FlowerProcess/src/ProcessNode.gd"), get_editor_interface().get_base_control().get_icon("Node", "EditorIcons"))

func _exit_tree():
	if main_panel_instance:
		main_panel_instance.queue_free()
	remove_custom_type("FlowerProcess")

func has_main_screen():
	return true

func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible

func get_plugin_name():
	return "Process"

func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")