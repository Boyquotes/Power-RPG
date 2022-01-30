extends Control

onready var title = $"根容器/信息/一部分/标题"
onready var text = $"根容器/信息/一部分/介绍"
onready var todo1_name = $"根容器/功能/容器一/容器二/任务表/任务/任务名"
onready var todo2_name = $"根容器/功能/容器一/容器二/任务表/任务2/任务名"
onready var todo3_name = $"根容器/功能/容器一/容器二/任务表/任务3/任务名"

func _ready():
	init()
	

func init():
	title.text = 数据.todo_title
	text.text = 数据.todo_text
	todo1_name.text = 数据.todo1_name
	todo2_name.text = 数据.todo2_name
	todo3_name.text = 数据.todo3_name
