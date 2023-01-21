extends Control

onready var inventory = $Inventory
onready var saveload = $SaveLoad
onready var story = $Story
onready var 排序按钮 = $Panel/Margin/Vbox2/Button/Sort
onready var 依据按钮 = $Panel/Margin/Vbox2/Button/Base
onready var 分类按钮 = $Panel/Margin/Vbox2/Button/Type

var random = RandomNumberGenerator.new()
var sort_base:String

func _ready():
	注册命令()
	控件初始化()

func story(role1:String, role2:String, time:String, location, 
			action, content:String, type):
	story.Generate_story([role1, role2, time, location, action, content, type])

func save(mode:String, key:String, value):
	match mode:
		"save":
			Persistence.save_scene(get_tree(), "user://savegame.save")
		"load":
			Persistence.load_scene(get_tree(), "user://savegame.save")

func 控件初始化():
	排序按钮.add_item("从大到小", 1)
	排序按钮.add_item("从小到大", 2)
	
	依据按钮.add_item("重量", 1)
	依据按钮.add_item("幸运", 2)
	依据按钮.add_item("价值", 3)
	
	分类按钮.add_item("武器", 1)

func _on_Sort_item_selected(index):
	match 排序按钮.get_item_id(index):
		1: # -> 从大到小
			get_sort_base()
			sort_item(sort_base, "large_to_small")
		2: # -> 从小到大
			get_sort_base()
			sort_item(sort_base, "small_to_large")

func get_sort_base():
	match 依据按钮.get_item_text(依据按钮.selected):
		"重量":
			sort_base = "weight"
		"幸运":
			sort_base = "lucky"
		"价值":
			sort_base = "value"

# ============== 背包 ==============
func 随机爆装备(次数:int):
	for i in 次数:
		random.randomize()
		var id = random.randi_range(200001, 200293)
		add_item(id, 1, "Weapons")

func add_item(id:int, num:int, type:String):
	inventory.add_item(id, num, type)

func del_item(id:int, num:int, type:String):
	inventory.del_item(id, num, type)

func type_item(type:String):
	inventory.type_item(type)

func sort_item(base:String, way:String):
	inventory.sort_item(base, way)
# ===================================

func 注册命令():
	Console.add_command('随机爆装备', self, '随机爆装备')\
		.set_description('随机爆装备')\
		.add_argument('num', TYPE_INT)\
		.register()
	
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
		.add_argument('mode', TYPE_STRING)\
		.add_argument('key', TYPE_STRING)\
		.add_argument('value', TYPE_STRING)\
		.register()
		
	Console.add_command('story', self, 'story')\
		.set_description('生成故事')\
		.add_argument('role1', TYPE_STRING)\
		.register()

