tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Goal", "Node", preload("Custom Types/bool_goal.gd"), preload("Icons/goal-icon.png"))
	add_custom_type("Quest", "Node", preload("Custom Types/quest.gd"), preload("Icons/quest-icon.png"))
	add_custom_type("NumericGoal", "Node", preload("Custom Types/int_goal.gd"), preload("Icons/goal-icon.png"))
	add_custom_type("AND", "Node", preload("Custom Types/and.gd"), preload("Icons/and-icon.png"))
	add_custom_type("OR", "Node", preload("Custom Types/or.gd"), preload("Icons/or-icon.png"))
	add_custom_type("Trigger", "Node", preload("Custom Types/trigger.gd"), preload("Icons/trigger-icon.png"))
	add_custom_type("Chapter", "Node", preload("Custom Types/chapter.gd"), preload("Icons/chapter-icon.png"))
	add_custom_type("Book", "Node", preload("Custom Types/book.gd"), preload("Icons/book-icon.png"))
	add_custom_type("Manager", "Node", preload("Custom Types/manager.gd"), preload("Icons/manager-icon.png"))


func _exit_tree():
	remove_custom_type("Goal")
	remove_custom_type("Quest")
	remove_custom_type("NumericGoal")
	remove_custom_type("AND")
	remove_custom_type("OR")
	remove_custom_type("Trigger")
	remove_custom_type("Chapter")
	remove_custom_type("Book")
	remove_custom_type("Manager")
