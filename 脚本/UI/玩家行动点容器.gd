extends "res://脚本/UI/行动点容器.gd"

onready var 行动点 = load("res://资源/场景/UI/行动点.tscn")

onready var 行动点1 = $行动点
onready var 行动点2 = $行动点2
onready var 行动点3 = $行动点3
onready var 行动点4 = $行动点4
onready var 行动点5 = $行动点5

func _ready():
	if 数据.行动点 == 5:
		print("5")
	elif 数据.行动点 == 4:
		行动点5.hide()
	elif 数据.行动点 == 3:
		行动点5.hide()
		行动点4.hide()
	elif 数据.行动点 == 2:
		行动点5.hide()
		行动点4.hide()
		行动点3.hide()
	elif 数据.行动点 == 1:
		行动点5.hide()
		行动点4.hide()
		行动点3.hide()
		行动点2.hide()
	else:
		行动点5.hide()
		行动点4.hide()
		行动点3.hide()
		行动点2.hide()
		行动点1.hide()

func 玩家添加行动点():
	if 数据.行动点 == 5:
		行动点5.show()
		行动点4.show()
		行动点3.show()
		行动点2.show()
		行动点1.show()
	elif 数据.行动点 == 4:
		行动点4.show()
		行动点3.show()
		行动点2.show()
		行动点1.show()
	elif 数据.行动点 == 3:
		行动点3.show()
		行动点2.show()
		行动点1.show()
	elif 数据.行动点 == 2:
		行动点2.show()
		行动点1.show()
	elif 数据.行动点 == 1:
		行动点1.show()
	elif 数据.行动点 > 5:
		行动点5.show()
		行动点4.show()
		行动点3.show()
		行动点2.show()
		行动点1.show()
	else:
		print("0")

func 玩家消耗行动点():	
	if 数据.行动点 == 5:
		print("5个行动点")
	elif 数据.行动点 == 4:
		行动点5.hide()
	elif 数据.行动点 == 3:
		行动点4.hide()
		行动点5.hide()
	elif 数据.行动点 == 2:
		行动点3.hide()
		行动点2.hide()
		行动点1.hide()
	elif 数据.行动点 == 1:
		行动点4.hide()
		行动点3.hide()
		行动点2.hide()
		行动点1.hide()
	elif 数据.行动点 == 0:
		行动点5.hide()
		行动点4.hide()
		行动点3.hide()
		行动点2.hide()
		行动点1.hide()
	else:
		print("出BUG辣")
