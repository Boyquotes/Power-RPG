extends Control

onready var 背包 = $背包

func _ready():
	Uhd.顶栏.hide()
	Uhd.底栏.hide()
	背包.随机爆装备(50)
