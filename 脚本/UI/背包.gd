extends Control

onready var grid = $"容器1/功能/容器2/容器3/装备格/格子"
onready var item = load("res://资源/场景/UI/背包格子.tscn").instance()

func _ready():
	数据.add_item(100001)
	初始化()


func 初始化():
	print(数据.player_bag)
	for i in 数据.player_bag.size():
		grid.add_child(item)
	
