extends PopupDialog

var title = "默认值"
var text = "默认值"

onready var 标题 = $"身体/信息/标题"
onready var 内容 = $"身体/信息/内容"

func _process(delta):
	标题.text = 数据.弹窗标题
	内容.text = 数据.弹窗内容

func _ready():
	标题.text = 数据.弹窗标题
	内容.text = 数据.弹窗内容
	self.hide()
	

func _on_确认_pressed():
	self.hide()
	pass
