extends Control

onready var texture = $bg

func _ready():
	#设置背包物品路径，使用之前必须add_item
	var patch = 数据.Item_data[数据.player_bag[0]].patch
	print("当前icon:" + patch)
	var texture_load = load(patch)
	texture.texture = texture_load
	
