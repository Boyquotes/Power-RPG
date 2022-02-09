tool
extends Goal

func _ready() -> void:
	for child in get_children():
		if child is Goal:
			child.connect("goal_updated", self, "update")


func update() -> void:
	var children_completion := false
	for child in get_children():
		if child is Goal:
			if child.is_complete:
				children_completion = true
	set_completion(children_completion)
