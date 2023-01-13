extends Control

export(int) var item_id
export(String) var item_type

var item_info:Array

func _on_物品模板_mouse_entered():
	# 通过ID拿到属性
	item_info.clear()
	# 0: name 1: desc 2: attack 3: defence 4: speed 5:value 6:weight 7:ucky
	item_info.append(Settings[item_type].data()[item_id].name)
	item_info.append(Settings[item_type].data()[item_id].desc)
	item_info.append(Settings[item_type].data()[item_id].attack)
	item_info.append(Settings[item_type].data()[item_id].defence)
	item_info.append(Settings[item_type].data()[item_id].speed)
	item_info.append(Settings[item_type].data()[item_id].value)
	item_info.append(Settings[item_type].data()[item_id].weight)
	item_info.append(Settings[item_type].data()[item_id].lucky)
	Uhd.物品悬浮(get_global_mouse_position(), item_info)

func _on_物品模板_mouse_exited():
	Uhd.物品悬浮离开()
