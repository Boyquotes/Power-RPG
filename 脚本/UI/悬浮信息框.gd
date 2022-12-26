extends Control

onready var 地名_ = $"Panel/Vbox/地名"
onready var 木材_ = $"Panel/Vbox/Vbox2/资源/Hbox/Vbox3/木材"
onready var 食物_ = $"Panel/Vbox/Vbox2/资源/Hbox/Vbox3/食物"
onready var 药材_ = $"Panel/Vbox/Vbox2/资源/Hbox/Vbox3/药材"
onready var 金石_ = $"Panel/Vbox/Vbox2/资源/Hbox/Vbox4/金石"
onready var 织物_ = $"Panel/Vbox/Vbox2/资源/Hbox/Vbox4/织物"
onready var 金币_ = $"Panel/Vbox/Vbox2/资源/Hbox/Vbox4/金币"

onready var npc_title = $"Panel/Vbox/Vbox2/NPC/标题"
onready var event_title = $"Panel/Vbox/Vbox2/事件/标题"
onready var label = preload("res://资源/场景/UI/label.tscn")

func 更新(信息数组, 事件数组, NPC数组):
	print("11当前NPC: " + str(NPC数组))
	地名_.text = 信息数组[0] + " 类型：" + str(信息数组[8])
	木材_.text = "木材：" + str(信息数组[1])
	食物_.text = "食物：" + str(信息数组[2])
	药材_.text = "药材：" + str(信息数组[3])
	金石_.text = "金石：" + str(信息数组[4])
	织物_.text = "织物：" + str(信息数组[5])
	金币_.text = "金币：" + str(信息数组[6])
	
	# 添加事件
	if str(事件数组[0]) == "没有NPC":
		删除子节点($"Panel/Vbox/Vbox2/事件/Vbox3")
		event_title.hide()
	else:
		删除子节点($"Panel/Vbox/Vbox2/事件/Vbox3")
		event_title.show()
		for i in 事件数组.size():
			print("EVENT SIZE:" + str(事件数组.size()))
			
			var b_label = label.instance()
			$"Panel/Vbox/Vbox2/事件/Vbox3".add_child(b_label)
			
			b_label.text = str(数据.Event_data.get(事件数组[i]).事件名)
			b_label.set("custom_colors/font_color", "bf8e4a")
	
	# 添加NPC
	if str(NPC数组[0]) == "没有NPC":
		删除子节点($"Panel/Vbox/Vbox2/NPC/Vbox3")
		npc_title.hide()
	else:
		删除子节点($"Panel/Vbox/Vbox2/NPC/Vbox3")
		npc_title.show()
		for i in NPC数组.size():
			print("NPC SIZE:" + str(NPC数组.size()))
			
			var b_label = label.instance()
			$"Panel/Vbox/Vbox2/NPC/Vbox3".add_child(b_label)
			
			b_label.text = str(数据.Npc_name_data.get(NPC数组[i]).人名)
	
	print(地名_.text + 木材_.text + 食物_.text + 药材_.text + 金石_.text + 织物_.text + 金币_.text)
	print()
	

func 删除子节点(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
