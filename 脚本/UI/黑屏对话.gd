extends CanvasLayer

onready var label = $Label

var file = File.new()

func _ready():
	self.layer = -128

func read_dialog(patch):
	file.open(patch, File.READ)
	label.text = file.get_line()
	self.layer = 1
