extends "res://脚本/地图/格子模板.gd"

onready var npc_name = 数据.Npc_name_data[600001]

var tele = load("res://脚本/数据/NPC类.gd")
var human = tele.new()
#var dialog = Dialogic.start("测试2")

func _ready():
	print("人类准备好了")
	var number = randi()%1123+600001
	npc_name = 数据.Npc_name_data[number]
	human.name = npc_name.人名
	print("生成人名:" + human.name)
	

func _on_人类_body_entered(body):
#	add_child(dialog)
	pass
