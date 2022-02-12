extends "res://脚本/地图/格子模板.gd"

var dialog
var res
var item_randi

func _ready():
	数据.dialog_res = preload("res://资源/对话/诗人.tres")
	print("诗人准备好了")

func _on_诗人_body_entered(body):
	randomize()
	dialog = randi()%1+1
	if dialog == 0:
		Uhd.dialog_normal("诗人1",数据.dialog_res)
		item_randi = 800001 + randi() % 22
		数据.add_武器(item_randi)
		print(数据.Weapons_data[item_randi[name]])
	elif dialog == 1:
		Uhd.dialog_normal("诗人2",数据.dialog_res)
	else:
		print("1")
