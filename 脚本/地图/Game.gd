extends Node2D

export(int, 0,100) var 生成图块数 = 100
export var 长 = 68
export var 宽 = 48

var 格子 = load("res://资源/场景/游戏/格子.tscn")

var poss
var add_poss = Vector2(0, 0)
var xx = 0
var yy = 0
var 生成记录 = []

func _ready():
	地图生成()
	

func 地图生成():
	# 确定图块坐标
	randomize()
	for i in 生成图块数:
		xx = randi()%长+1
		yy = randi()%宽+1	
		if 生成记录.has(xx):
			print("xx")
			if 生成记录.has(yy):
				生成图块数 -= 1
			else:
				change_float()
				poss.x = xx
				poss.y = yy
				print("x：" + str(xx) + ";" + "y：" + str(yy))
				add_poss = 格子.poss
				self.add_child(add_poss).instance()
				生成记录.append(xx)
				生成记录.append(yy)
		elif 生成记录.has(yy):
			if 生成记录.has(xx):
				生成图块数 -= 1
			else:
				change_float()
				poss.x = xx
				poss.y = yy
				print("x：" + str(xx) + ";" + "y：" + str(yy))
				add_poss = 格子.poss
				self.add_child(add_poss).instance()
				生成记录.append(xx)
				生成记录.append(yy)
		else:
			change_float()
			poss.x = xx
			poss.y = yy
			print("x：" + str(xx) + ";" + "y：" + str(yy))
			add_poss = 格子.poss
			self.add_child(add_poss).instance()
			生成记录.append(xx)
			生成记录.append(yy)

func change_float():
	float(poss.x)
	float(poss.y)
