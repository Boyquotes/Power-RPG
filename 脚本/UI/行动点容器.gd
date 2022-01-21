extends VBoxContainer

onready var 行动点 = load("res://资源/场景/UI/行动点.tscn")

func 添加行动点():
	self.add_child(行动点.instance())
	数据.行动点 += 1


	
