extends Control

onready var animation = $AnimationPlayer
onready var player_name = $"TextureRect/角色创建/LineEdit"
onready var r = $TextureRect/右边
onready var 存档名1 = $"TextureRect/读取游戏/存档/存档一/存档名"

func _ready():
	animation.play("RESET")
	animation.play("待机")

func _input(event):
	if event.is_action_released("space"):
		if 数据.file.file_exists(数据.save_path):
			数据.file.open(数据.save_path, File.READ)
			数据.player = 数据.file.get_var()
			数据.file.close()
			print("存在")
			存档名1.text = 数据.player["Name"]
			$TextureRect/读取游戏.show()
			animation.play("读取游戏")
			yield(animation, "animation_finished")
		else:
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
		var dir = Directory.new()
		数据.player["Name"] = player_name.text
		数据.file.open(数据.save_path, File.WRITE)
		数据.file.store_var(数据.player)
		数据.file.close()
		print(数据.player["Name"])
		changer_scence.changer("res://资源/场景/Test2.tscn")
	pass


func _on_新建存档_pressed():
	animation.play("新建存档")
	$TextureRect/角色创建.show()
	yield(animation, "animation_finished")
	$TextureRect/读取游戏.hide()
	pass


func _on_读取_pressed():
	changer_scence.changer("res://资源/场景/Test2.tscn")
	pass
