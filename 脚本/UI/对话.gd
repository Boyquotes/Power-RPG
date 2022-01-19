extends CanvasLayer

onready var dialog = $DialogNode

func _ready():
	pass

func start():
	dialog.show()
	dialog.show_text(数据.Dialog_data[700001].text)
