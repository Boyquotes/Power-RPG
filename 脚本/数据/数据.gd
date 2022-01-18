extends Node

var save_path = "user://data.dat"
var Item_data = Settings.Item.data()
var Skills_data = Settings.Skills.data()
var Weapons_data = Settings.Weapons.data()
var Enemy_data = Settings.Enemy.data()
var Map_name_data = Settings.Map_name.data()

var player = {
	"Name": "Zero",
	"Attack": 100,
	"Hp": 100,
	"Speed": 100,
	"Cost": 0
}

var file = File.new()

onready var save_nodes = get_tree().get_nodes_in_group("持久化")
onready var 弹窗标题 = "出BUG辣！"
onready var 弹窗内容 = "如果你看到这串话，说明游戏出BUG了，请反馈给开发者。"

func _ready():
	pass
