extends Node

var save_path = "user://存档一.存档"

var Item_data = Settings.Item.data()
var Skills_data = Settings.Skills.data()
var Weapons_data = Settings.Weapons.data()
var Enemy_data = Settings.Enemy.data()
var Map_name_data = Settings.Map_name.data()
var Npc_name_data = Settings.Npc_name.data()
var Dialog_data = Settings.diglog.data()

var dialog = "res://资源/场景/UI/对话.tscn"
var loader = ResourceInteractiveLoader
var load_path = "res://资源/场景/Test3.tscn"

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
var player_bag_temp
var player_bag = [100001]
func add_item(item_id):
	player_bag.push_back(item_id)

func add_武器(item_id):
	player_bag.push_back(item_id)

func add_技能(item_id):
	player_bag.push_back(item_id)

func add_装备(item_id):
	player_bag.push_back(item_id)


#系统相关
var 第一次游戏 = true
var 弹窗标题 = "出BUG辣！"
var 弹窗内容 = "如果你看到这串话，说明游戏出BUG了，请反馈给开发者。"

#对话相关：
var dialog_res = preload("res://资源/对话/测试对话.tres")

#函数
func _ready():
	pass

