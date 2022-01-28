extends Control

onready var animation = $AnimationPlayer
onready var player_name = $"TextureRect/角色创建/LineEdit"
onready var r = $TextureRect/右边
onready var 存档名1 = $"TextureRect/读取游戏/存档/存档一/存档名"

var npc_n = "默认NPC"
var on_main = true

func _ready():
	animation.play("RESET")
	yield(animation, "animation_finished")
	$TextureRect/角色创建.hide()
	$TextureRect/读取游戏.hide()
	animation.play("待机")

func _input(event):
	if event.is_action_released("space"):
		if on_main == true:
			print("存档存在")
			if 数据.file.file_exists(数据.save_path):
				数据.file.open(数据.save_path, File.READ)
				数据.player = 数据.file.get_var()
				数据.file.close()
				存档名1.text = 数据.player["Name"]
				on_main = false
				$TextureRect/读取游戏.show()
				animation.play("读取游戏")
				yield(animation, "animation_finished")
			else:
				on_main = false
				$TextureRect/角色创建.show()
				animation.play("创建角色")
				yield(animation, "animation_finished")
		

func _on_继续_pressed():
	if player_name.text == "":
		print(数据.player["Name"])
		数据.弹窗标题 = "警告"
		数据.弹窗内容 = "名称不能为空"
		print(数据.弹窗标题)
		print(数据.弹窗内容)
		弹窗.popup()
	else:
		save()

func save():
	数据.player["Name"] = player_name.text
#	打开文件
	数据.file.open(数据.save_path, File.WRITE)
#	写入文件
	数据.file.store_var(数据.player)
	print(数据.player["Name"])
	for num in 500:
		var name_num = randi()%1123+600001
		npc_n = 数据.Npc_name_data[name_num]
		print(npc_n.人名)
		数据.file.store_var(npc_n.人名)
	数据.file.close()
	print("save done")
	数据.load_path = "res://资源/场景/Test2.tscn"
	get_tree().call_group("loading", "loading")
	changer_scence.changer("res://资源/场景/UI/Loding.tscn")

func load_save():
	pass


func _on_新建存档_pressed():
	animation.play("新建存档")
	$TextureRect/角色创建.show()
	yield(animation, "animation_finished")
	$TextureRect/读取游戏.hide()
	

func _on_读取_pressed():
	数据.file.open(数据.save_path, File.READ)
	数据.player = 数据.file.get_var()
	数据.file.close()
	print(数据.player)
	数据.load_path = "res://资源/场景/Test2.tscn"
	get_tree().call_group("loading", "loading")
	changer_scence.changer("res://资源/场景/UI/Loding.tscn")
