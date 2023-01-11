extends Panel

onready var npc_name = $"Panel/Hbox/Mar/Vbox/Vbox2/名称"
onready var npc_age = $"Panel/Hbox/Mar/Vbox/Vbox2/年龄"
onready var portrait = $Panel/肖像

var dialogue_resource = preload("res://资源/对话/测试对话.tres")

func update_info(npc_class):
	npc_name.text = str(npc_class.name["人名"])
	npc_age.text = str(npc_class.age)
	# [脸型，头发，眼睛，眉毛，嘴巴，鼻子，衣服]
	portrait.get_node("脸型").texture = load("res://资源/图片/捏脸/脸型/脸型" + str(npc_class.portrait[0]) + ".png")
	portrait.get_node("头发").texture = load("res://资源/图片/捏脸/头发/头发" + str(npc_class.portrait[1]) + ".png")
	portrait.get_node("左眼睛").texture = load("res://资源/图片/捏脸/眼睛/眼睛" + str(npc_class.portrait[2]) + ".png")
	portrait.get_node("左眉毛").texture = load("res://资源/图片/捏脸/眉毛/眉毛" + str(npc_class.portrait[3]) + ".png")
	portrait.get_node("嘴巴").texture = load("res://资源/图片/捏脸/嘴巴/嘴巴" + str(npc_class.portrait[4]) + ".png")
	portrait.get_node("鼻子").texture = load("res://资源/图片/捏脸/鼻子/鼻子" + str(npc_class.portrait[5]) + ".png")
	portrait.get_node("衣服").texture = load("res://资源/图片/捏脸/衣服/衣服" + str(npc_class.portrait[6]) + ".png")
	

func _on_NPC信息框_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			点击NPC()

func 点击NPC():
	get_tree().call_group("普通对话", "对话初始化", "小王", npc_name.text)
	Uhd.show_dialogue("Test", dialogue_resource)


func _on_左眼睛_texture_changed():
	portrait.get_node("右眼睛").texture = portrait.get_node("左眼睛").texture


func _on_左眉毛_texture_changed():
	portrait.get_node("右眉毛").texture = portrait.get_node("左眉毛").texture
