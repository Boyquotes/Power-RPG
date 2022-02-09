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
			children_completion = child.is_complete
			if !children_completion:
				break
	set_completion(children_completion)

func get_completion_percentage() -> float:
	var num_completed = 0
	for child in get_children():
		if child is Goal:
			if child.is_complete:
				num_completed += 1
	return float(num_completed) / float(get_child_count())
