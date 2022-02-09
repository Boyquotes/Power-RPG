tool
extends Goal

signal activated
signal deactivated
signal abandoned

enum status {
	ACTIVE,
	INACTIVE,
	ABANDONED
}

export(status) var quest_status = status.INACTIVE

func _ready() -> void:
	for child in get_children():
		if child.name == "Goals":
			if child.get_child_count() > 0:
				var goal_child := $Goals.get_child(0)
				if goal_child is Goal:
					goal_child.connect("goal_updated", self, "update")
		if child.name == "Triggers":
			if child.get_child_count() > 0:
				var trigger_child := $Triggers.get_child(0)
				if trigger_child is Goal:
					trigger_child.connect("goal_updated", self, "update")

func activate() -> void:
	quest_status = status.ACTIVE
	emit_signal("activated")

func deactivate() -> void:
	quest_status = status.INACTIVE
	emit_signal("deactivated")

func abandon() -> void:
	quest_status = status.ABANDONED
	emit_signal("abandoned")

func update() -> void:
	if quest_status == status.ACTIVE:
		for child in get_children():
			if child.name == "Goals":
				if child.get_child_count() > 0:
					var goal_child := $Goals.get_child(0)
					if goal_child is Goal:
						set_completion(goal_child.is_complete)
						
	if quest_status != status.ABANDONED:
		for child in get_children():
			if child.name == "Triggers":
				if child.get_child_count() > 0:
					var trigger_child := $Triggers.get_child(0)
					if trigger_child is Goal:
						if trigger_child.is_complete:
							activate()
						else:
							deactivate()
