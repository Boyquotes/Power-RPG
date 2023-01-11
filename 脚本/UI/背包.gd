extends Control

onready var inventory = $Inventory

func _ready():
	# 注册控制台指令
	# 第二行传入参数
	Console.add_command('add_item', self, 'add_item')\
		.set_description('从背包里添加物品')\
		.add_argument('id', TYPE_INT)\
		.add_argument('num', TYPE_INT)\
		.add_argument('TYPE', TYPE_STRING)\
		.register()
	
	Console.add_command('del_item', self, 'del_item')\
		.set_description('从背包里删除物品')\
		.add_argument('id', TYPE_INT)\
		.add_argument('num', TYPE_INT)\
		.add_argument('TYPE', TYPE_STRING)\
		.register()
	
	inventory.add_item(200001, 12, "Weapons")

func add_item(id, num, type):
	inventory.add_item(id, num, type)

func del_item(id, num, type):
	inventory.del_item(id, num, type)
