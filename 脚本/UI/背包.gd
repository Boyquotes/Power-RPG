extends Control

onready var grid = $"容器1/功能/容器2/容器3/装备格/格子"
onready var item = load("res://资源/场景/UI/背包格子.tscn")

func _ready():
#	数据.add_item(100001)
#	数据.add_item(100002)
	初始化()
	

func 初始化():
	print(数据.player_bag)
	
#	var item_num = 0
#	print(数据.player_bag)
#	print(数据.player_bag.size())
#	#读取玩家背包数据，添加格子数量
#	while item_num < 数据.player_bag.size():
#		grid.add_child(item.instance())
#		print("添加了一个物品")
#		item_num += 1
		
		
	
