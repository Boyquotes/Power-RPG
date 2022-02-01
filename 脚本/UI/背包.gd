extends Control

onready var grid = $"容器1/功能/容器2/容器3/装备格/格子"
onready var item = load("res://资源/场景/UI/背包格子.tscn")

func _ready():
#	数据.add_item(100001)
#	数据.add_item(100002)
	初始化()
	

func 初始化():
	var now_bag = 数据.player_bag.size()
	var item_num = 0
	print("当前背包物品数量：" + str(now_bag))
	#读取玩家背包数据，添加格子数量
	while item_num < now_bag:
		grid.add_child(item.instance())
		print("添加了一个物品")
		item_num += 1
		

#当点击装备按钮
func _on_装备_pressed():
	print("点击了装备按钮")
	get_tree().call_group("UHD", "hide_go_main")
