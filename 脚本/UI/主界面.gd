extends Control

onready var animation = $AnimationPlayer
onready var player_name = $"TextureRect/角色创建/LineEdit"
onready var r = $TextureRect/右边
onready var 存档名1 = $"TextureRect/读取游戏/存档/存档一/存档名"

var npc_n = "默认NPC"
#这个变量是为了屏蔽玩家的空格键
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
			if 数据.file.file_exists(数据.save_path):
				print("存档存在")
				load_save()
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
	#随机生成人名
	for num in 500:
		var name_num = randi()%1123+600001
		npc_n = 数据.Npc_name_data[name_num]
		print(npc_n.人名)
		数据.file.store_var(npc_n.人名)
	#添加初始背包道具
	数据.player_bag_temp = 100001
	数据.add_item(数据.player_bag_temp)
	#添加到背包数组
	数据.file.store_var(数据.player_bag)
	#关闭文件
	数据.file.close()
	print("保存完成")
	#加载存档
	load_save()
	数据.load_path = "res://资源/场景/Test2.tscn"
	get_tree().call_group("loading", "loading")
	changer_scence.changer("res://资源/场景/UI/Loding.tscn")

#加载函数哈哈哈哈哈哈哈哈哈哈
func load_save():
	#打开文件
	数据.file.open(数据.save_path, File.READ)
	
#	把文件内容赋值到player
	数据.player = 数据.file.get_var()
	
	#把文件内容读到背包
	数据.add_item(数据.player_bag)
	
	#把文件内容读到人物配置
	
	#把文件内容读到任务
	
	#关闭文件
	数据.file.close()
	
	读取游戏()


func 读取游戏():
	#把存档名变成玩家名
	存档名1.text = 数据.player["Name"]
	#不在开始菜单了
	on_main = false
	
	#显示出读取游戏
	$TextureRect/读取游戏.show()
	
	#播放动画并等待完成
	animation.play("读取游戏")
	yield(animation, "animation_finished")


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
