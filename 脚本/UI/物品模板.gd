extends Control

var item_id:int # -> 物品ID
var item_type:String # -> 物品类型

var item_info:Array

var item_num:int # -> 物品数量
var item_name:String # -> 物品名
var item_affix:int # -> （上面的词缀ID）
var item_effect:int # -> （下面的特殊效果ID）
# 把数据存到这里

func _on_物品模板_mouse_entered():
	item_name = Settings.Affix.data()[item_affix].name + " · " + Settings[item_type].data()[item_id].name
	# 通过ID拿到属性
	item_info.clear()
	# 0:name -> array[name, id, type] 1: desc 2: attack 3: defence 4: speed 5:value 6:weight 7:lucky 8:effect_id 9:affix_id
	item_info.append([item_name, item_id, item_type])
	item_info.append(Settings[item_type].data()[item_id].desc)
	item_info.append(Settings[item_type].data()[item_id].attack)
	item_info.append(Settings[item_type].data()[item_id].defence)
	item_info.append(Settings[item_type].data()[item_id].speed)
	item_info.append(Settings[item_type].data()[item_id].value)
	item_info.append(Settings[item_type].data()[item_id].weight)
	item_info.append(Settings[item_type].data()[item_id].lucky)
	item_info.append(item_effect)
	item_info.append(item_affix)
	Uhd.物品悬浮(get_global_mouse_position(), item_info)

func _on_物品模板_mouse_exited():
	Uhd.物品悬浮离开()

func 生成物品信息():
	pass

