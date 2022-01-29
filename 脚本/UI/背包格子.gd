extends Control

onready var texture = $bg

func _ready():
	var patch = 数据.Item_data[数据.player_bag[0]].patch
	print("当前icon:" + patch)
	#texture = 数据.Item_data.数据.player_bag[0].patch
	
	
