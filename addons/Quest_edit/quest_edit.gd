tool
extends EditorPlugin

const main = preload("res://addons/Quest_edit/Quest_edit.tscn")
var main_instance

func _enter_tree():
	main_instance = main.instance()
	get_editor_interface().get_editor_viewport().add_child(main_instance)
	make_visible(false)

func _exit_tree():
	if main_instance:
		main_instance.queue_free()

func has_main_screen():
	return true

func make_visible(visible):
	if main_instance:
		main_instance.visible = visible

func get_plugin_name():
	return "Quest_edit"

func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
