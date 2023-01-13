extends Node

var save_path = "user://存档一.存档"

var Item_data = Settings.Item.data()
var Skills_data = Settings.Skills.data()
var Weapons_data = Settings.Weapons.data()
var Enemy_data = Settings.Enemy.data()
var Map_name_data = Settings.Map_name.data()
var Npc_name_data = Settings.Npc_name.data()
var Dialog_data = Settings.diglog.data()
var Event_data = Settings.event.data()

var dialog = "res://资源/场景/UI/对话.tscn"
var loader = ResourceInteractiveLoader
var load_path = "res://资源/场景/Test3.tscn"

# Class
class map_block:
	var name:String
	
	var time:int
	var type:int
	var wood:int
	var food:int
	var metals:int
	var medicinal:int
	var fabric:int
	var coin:int
	var event:Array
	var npcs:Array
	
	func sout():
		print("[MapBlock]: 索引:%s 名称:%s 食物:%s 木材:%s 事件:%s NPC:%s 金币:%s 时间:%s"
		%[type, name, food, wood, event, npcs, coin, time])

class npcs:
	var name
	var age: int
	var gender: int
	# [脸型，头发，眼睛，眉毛，嘴巴，鼻子，衣服]
	var portrait: Array
	var feel: int
	

# 互动
var 互动类型:Dictionary = {
	"交谈": "角色A和角色B交谈",
	"切磋": "角色A和角色B交谈",
	"比试": "角色A和角色B交谈",
	"邀约": "角色A和角色B交谈",
	"赠送礼物": "角色A和角色B交谈",
	"知心而交": "角色A和角色B交谈",
	"义结金兰": "角色A和角色B交谈",
	"结为义亲": "角色A和角色B交谈",
	"邀为同道": "角色A和角色B交谈",
	"化解仇怨": "角色A和角色B交谈",
	"倾诉爱意": "角色A和角色B交谈",
	"共结连理": "角色A和角色B交谈",
	"春宵": "角色A和角色B交谈",
	"欺侮": "角色A和角色B交谈",
	"怀孕": "角色A和角色B交谈",
	"生育": "角色A和角色B交谈",
	"比武招亲": "角色A和角色B交谈",
	"远走高飞": "角色A和角色B交谈",
	"偷师功法": "角色A和角色B交谈",
	"下毒": "角色A和角色B交谈",
	"抢夺": "角色A和角色B交谈",
	"偷窃": "角色A和角色B交谈",
	"袭击": "角色A和角色B交谈",
	"劫持": "角色A和角色B交谈",
	"惩戒": "角色A和角色B交谈",
	"羞辱": "角色A和角色B交谈",
}

# 存档相关
var key_list = []
var key = 0
# 数组的顺序
var num = 0

func born_key():
	mmkv.initMMKV("厉害RPG", "save.default")
	for i in 999999:
		randomize()
		key = str(i) + str(rand_range(0, 1000)) + str(OS.get_unix_time())
		key_list.append(key)
		

#关于大地图
var map_data = []

var 在大地图 = false

func 大地图初始化():
	pass

#	if 数据.file.file_exists(数据.save_path):
#		$TextureRect/main/继续.disabled = false
#	else:
#		$TextureRect/main/继续.disabled = true

#玩家相关
var player_skills = [300001]
var player = {
	"Name": "Zero",
	"Attack": 100,
	"Hp": 100,
	"Speed": 5,
	"Cost": 0,
	"Img": "res://资源/图片/立绘/主角小.png",
	"Skills": "300001",
	"Bag": 100001
}

#任务相关
var todo_title = "出BUG的任务"
var todo_text = "如果你看到这串文字，说明你的游戏出BUG了，请反馈给开发者。"
var todo1_name = "BUG任务一"
var todo2_name = "BUG任务二"
var todo3_name = "BUG任务三"

#文件相关
var file = File.new()

#战斗相关
var 这次战斗敌人 = "出BUG了"
var 这次战斗敌人名 = "出BUG了"
var 敌人立绘 = "res://资源/图片/立绘/主角小.png"
var 行动点 = 0

#背包相关
#var player_bag_temp
#var player_bag = [100001]
#func add_item(item_id):
#	player_bag.push_back(item_id)
#
#func add_武器(item_id):
#	player_bag.push_back(item_id)
#
#func add_技能(item_id):
#	player_bag.push_back(item_id)
#
#func add_装备(item_id):
#	player_bag.push_back(item_id)


#系统相关
var 第一次游戏 = true
var 弹窗标题 = "出BUG辣！"
var 弹窗内容 = "如果你看到这串话，说明游戏出BUG了，请反馈给开发者。"

#对话相关：
var dialog_res = preload("res://资源/对话/测试对话.tres")

#函数
func _ready():
	pass

