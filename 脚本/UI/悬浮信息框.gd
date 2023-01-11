extends Control

onready var 地名_ = $"Panel/Vbox/VVbox/MarginContainer/地名"
onready var 木材_ = $"Panel/Vbox/Mar/Vbox2/资源/Hbox/Vbox3/Hbox/木材"
onready var 食物_ = $"Panel/Vbox/Mar/Vbox2/资源/Hbox/Vbox3/Hbox2/食物"
onready var 药材_ = $"Panel/Vbox/Mar/Vbox2/资源/Hbox/Vbox3/Hbox3/药材"
onready var 金石_ = $"Panel/Vbox/Mar/Vbox2/资源/Hbox/Vbox4/Hbox/金石"
onready var 织物_ = $"Panel/Vbox/Mar/Vbox2/资源/Hbox/Vbox4/Hbox2/织物"
onready var 金币_ = $"Panel/Vbox/Mar/Vbox2/资源/Hbox/Vbox4/Hbox3/金币"

# 动态内容
onready var npc_title = $"Panel/Vbox/Mar/Vbox2/NPC/标题"
onready var event_title = $"Panel/Vbox/Mar/Vbox2/事件/标题"
onready var label = preload("res://资源/场景/UI/label.tscn")

func 更新(信息数组, 事件数组, NPC数组):
	地名_.text = str(信息数组[0]) + " • " + "类型：" + str(信息数组[8])
	木材_.text = str(信息数组[1])
	食物_.text = str(信息数组[2])
	药材_.text = str(信息数组[3])
	金石_.text = str(信息数组[4])
	织物_.text = str(信息数组[5])
	金币_.text = str(信息数组[6])
	
	# 添加事件
	if str(事件数组[0]) == "没有事件":
		删除子节点($"Panel/Vbox/Mar/Vbox2/事件/Vbox3")
		event_title.hide()
	else:
		删除子节点($"Panel/Vbox/Mar/Vbox2/事件/Vbox3")	
		event_title.show()
		for i in 事件数组.size():
			var b_label = label.instance()
			$"Panel/Vbox/Mar/Vbox2/事件/Vbox3".add_child(b_label)
			# 事件数组[i] 一定要转成Int，MMKV会自动转成Str
			b_label.text = str(数据.Event_data.get(int(事件数组[i])).事件名)
			b_label.set("custom_colors/font_color", "bf8e4a")
	
	# 添加NPC
	if str(NPC数组[0]) == "没有NPC":
		删除子节点($"Panel/Vbox/Mar/Vbox2/NPC/Vbox3")
		npc_title.hide()
	else:
		删除子节点($"Panel/Vbox/Mar/Vbox2/NPC/Vbox3")
		npc_title.show()
		for i in NPC数组.size():
			var b_label = label.instance()
			$"Panel/Vbox/Mar/Vbox2/NPC/Vbox3".add_child(b_label)
			
			b_label.text = str(数据.Npc_name_data.get(int(NPC数组[i])).人名)

	# 自适应大小，两个数据必须都进行加运算
	$Panel/Vbox.rect_size.y = 27 + 地名_.rect_size.y + $Panel/Vbox/Mar/Vbox2.rect_size.y
	$Panel.rect_size.y = $Panel/Vbox.rect_size.y + 50

func reset():
	删除子节点($"Panel/Vbox/Mar/Vbox2/NPC/Vbox3")
	删除子节点($"Panel/Vbox/Mar/Vbox2/事件/Vbox3")
	

func 删除子节点(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
