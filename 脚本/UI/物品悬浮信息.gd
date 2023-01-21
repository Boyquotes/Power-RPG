extends Panel

onready var 名称 = $Panel/Vbox/VVbox/MarginContainer/武器名
#onready var 描述
onready var 攻击 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox/Hbox/Label2
onready var 防御 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox/Hbox2/Label2
onready var 速度 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox2/Hbox/Label2
onready var 重量 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox2/Hbox3/Label2
onready var 幸运 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox/Hbox3/Label2
onready var 价值 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox2/Hbox2/Label2
onready var 特殊效果 = $Panel/Vbox/Mar/Vbox/Vbox3/Vbox/Label
onready var 额外效果 = $Panel/Vbox/Mar/Vbox/Vbox2/Vbox
onready var 额外效果文本 = preload("res://资源/场景/UI/label.tscn")
onready var bar = $Panel/Vbox/VVbox/MarginContainer

var effect_color:String
var reg = RegEx.new()

func update_info(item_info:Array):
	# 0:name -> array[name, id, type] 1:desc 2:attack 3:defence 4:speed 5:value 6:weight 7:lucky 8:effect_id 9:affix_id
	名称.text = item_info[0][0]
	match Settings[item_info[0][2]].data()[item_info[0][1]].level:
		1:
			bar.texture = load("res://资源/图片/UI/灰色bar.png")
		2:
			bar.texture = load("res://资源/图片/UI/黄色bar.png")
		3:
			bar.texture = load("res://资源/图片/UI/绿色bar.png")
		4:
			bar.texture = load("res://资源/图片/UI/紫色bar.png")
		5:
			bar.texture = load("res://资源/图片/UI/红色bar.png")
	攻击.text = str(item_info[2])
	防御.text = str(item_info[3])
	速度.text = str(item_info[4])
	价值.text = str(item_info[5])
	重量.text = str(item_info[6])
	幸运.text = str(item_info[7])
	# 根据ID改
	match Settings.Effect.data()[item_info[8]].level:
		1:
			effect_color = "#BF8E4A"
		2:
			effect_color = "#58AFC2"
		3:
			effect_color = "#36C392"
		4:
			effect_color = "#A3527B"
		5:
			effect_color = "#FB4841"
	
	特殊效果.bbcode_text = '[color=%s]%s：[/color]%s'%[effect_color, Settings.Effect.data()[item_info[8]].name,
	Settings.Effect.data()[item_info[8]].desc]
	
	# =========== 额外效果 ==========
	var result:Array
	var temp_search = Settings.Affix.data()[item_info[9]].effect
	reg.clear()
	# 匹配 + 号前面
	reg.compile("^\\w+(?=)")
	result.append(reg.search(temp_search)) # -> exp
	# 匹配 [] 号里面
	reg.compile("(?<=\\[).+?(?=\\])")
	result.append(reg.search(temp_search)) # -> 4-5
	# 转换成文本
	match result[0].get_string():
		"exp":
			result[0] = "经验 + "
		"hp":
			result[0] = "血量 + "
		"atk":
			result[0] = "攻击 + "
		"def":
			result[0] = "防御 + "
		"mp":
			result[0] = "法力 + "
		"spd":
			result[0] = "速度 + "
		
	额外效果文本 = 额外效果文本.instance()
	额外效果.add_child(额外效果文本)
	额外效果文本.text = result[0] + result[1].get_string()
	额外效果文本.set("custom_colors/font_color", "bf8e4a")
	
