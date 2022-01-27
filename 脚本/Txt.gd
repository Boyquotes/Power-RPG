extends Control

func InputEvent():
	pass

func _ready():
	OS.execute("notepad", [], false)
	var ev = InputEvent()
	ev.type = InputEvent.KEY
	ev.scancode = "left"
	get_tree().input_event(ev)
