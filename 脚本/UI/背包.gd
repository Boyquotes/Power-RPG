extends Control

onready var inventory = $Inventory
onready var saveload = $SaveLoad
onready var story = $Story

func _ready():
	# 注册控制台指令
	# 第二行传入参数
	Console.add_command('add_item', self, 'add_item')\
		.set_description('从背包里添加物品')\
		.add_argument('id', TYPE_INT)\
		.add_argument('num', TYPE_INT)\
		.add_argument('type', TYPE_STRING)\
		.register()
	
	Console.add_command('del_item', self, 'del_item')\
		.set_description('从背包里删除物品')\
		.add_argument('id', TYPE_INT)\
		.add_argument('num', TYPE_INT)\
		.add_argument('type', TYPE_STRING)\
		.register()
	
	Console.add_command('type_item', self, 'type_item')\
		.set_description('分类背包中的物品')\
		.add_argument('type', TYPE_STRING)\
		.register()
	
	Console.add_command('sort_item', self, 'sort_item')\
		.set_description('排序背包中的物品')\
		.add_argument('base', TYPE_STRING)\
		.add_argument('way', TYPE_STRING)\
		.register()
		
	Console.add_command('save', self, 'save')\
		.set_description('存档')\
		.add_argument('key', TYPE_STRING)\
		.add_argument('value', TYPE_STRING)\
		.add_argument('mode', TYPE_STRING)\
		.register()
		
	Console.add_command('story', self, 'story')\
		.set_description('生成故事')\
		.add_argument('role1', TYPE_STRING)\
		.register()
		
	inventory.add_item(200001, 12, "Weapons")
	inventory.add_item(200002, 12, "Weapons")
	inventory.add_item(200003, 12, "Weapons")
	inventory.add_item(200004, 12, "Weapons")
	
	
#	story("小王", "小李", "十二月四日", null, null, "界青十四剑", null)
#	 0     1      2       3      4       5          6
# [小王, 小李，十月四日，北京，指导，界青十四剑，指导武功]
func story(role1:String, role2:String, time:String, location, 
			action, content:String, type):
	story.Generate_story([role1, role2, time, location, action, content, type])

func save(key:String, value, mode:String):
	if mode == "save":
		saveload.save(key, value)
	else:
		saveload.load_save(key, value)
		

# ============== 背包 ==============
func add_item(id:int, num:int, type:String):
	inventory.add_item(id, num, type)

func del_item(id:int, num:int, type:String):
	inventory.del_item(id, num, type)

func type_item(type:String):
	inventory.type_item(type)

func sort_item(base:String, way:String):
	inventory.sort_item(base, way)
