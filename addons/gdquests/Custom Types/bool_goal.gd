tool
extends Node

class_name Goal

signal goal_updated

export(String) var title = ""
export(String, MULTILINE) var description = ""
export(bool) var is_sticky = false

var is_complete := false setget set_completion

func set_completion(new_value : bool) -> void:
	if is_sticky:
		if !is_complete:
			is_complete = new_value
	else:
		is_complete = new_value
	emit_signal("goal_updated")
