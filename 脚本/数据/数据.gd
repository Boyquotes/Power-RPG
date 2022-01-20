extends Node

var save_path = "user://data.dat"
var Item_data = Settings.Item.data()
var Skills_data = Settings.Skills.data()
var Weapons_data = Settings.Weapons.data()
var Enemy_data = Settings.Enemy.data()
var Map_name_data = Settings.Map_name.data()
var Npc_name_data = Settings.Npc_name.data()
var Dialog_data = Settings.diglog.data()

var dialog_node = DialogNode.instance()
var dialog = "res://资源/场景/UI/对话.tscn"

#	if 数据.file.file_exists(数据.save_path):
#		$TextureRect/main/继续.disabled = false
#	else:
#		$TextureRect/main/继续.disabled = true

var player = {
	"Name": "Zero",
	"Attack": 100,
	"Hp": 100,
	"Speed": 20,
	"Cost": 0,
	"Img": "res://资源/图片/立绘/主角小.png",
	"Skills": "300001"
}

var player_skills = [300001]

var file = File.new()

var 这次战斗敌人 = "出BUG了"
var 这次战斗敌人名 = "出BUG了"

onready var save_nodes = get_tree().get_nodes_in_group("持久化")
onready var 弹窗标题 = "出BUG辣！"
onready var 弹窗内容 = "如果你看到这串话，说明游戏出BUG了，请反馈给开发者。"

func _ready():
	pass

