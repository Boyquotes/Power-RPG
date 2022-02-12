extends Control

onready var animation = $AnimationPlayer
onready var player_name = $"TextureRect/角色创建/LineEdit"
onready var r = $TextureRect/右边
onready var 存档名1 = $"TextureRect/读取游戏/存档/存档一/存档名"
onready var 立绘节点 = $"TextureRect/主角1"

var npc_n = {
	"名字": "默认NPC",
	"年龄": 64,
	"性别": 1, #1男2女
	"职业": "无业游民",
	"血量": 100,
	"攻击力": 100,
	"防御力": 100,
	"速度": 100,
	"技能": [300001],
	"背包": [100001,100002,100003]
}
var 立绘
#这个变量是为了屏蔽玩家的空格键
var on_main = true

func _ready():
	randomize()
#	数据.dialog_res = preload("res://资源/对话/测试对话.tres")
#	Uhd.dialog_normal(
#		"Test",
#		数据.dialog_res
#	)
	animation.play("RESET")
	yield(animation, "animation_finished")
	$TextureRect/角色创建.hide()
	$TextureRect/读取游戏.hide()
	animation.play("待机")
	#返回0到2的随机整数
	立绘 = randi()%2+1
	print(立绘)
	if 立绘 == 1:
		立绘节点.texture = load("res://资源/图片/立绘/主角小-黑.png")
	else:
		立绘节点.texture = load("res://资源/图片/立绘/黑/剑士立绘黑.png")
	Print.line(str(Print.BLACK + Print.WHITE_BACKGROUND, "Nihao") + Print.BLUE, "蓝色测试一下")

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
		Uhd.弹窗()
	else:
		save()

func save():
	数据.player["Name"] = player_name.text
	#打开文件
	数据.file.open(数据.save_path, File.WRITE)
	#把玩家信息写入文件
	数据.file.store_var(数据.player)
	print(数据.player["Name"])
	#随机生成NPC名 & 把NPC信息写入文件
	for num in 500:
		var name_num = randi()%1123+600002
		npc_n["名字"] = 数据.Npc_name_data[name_num].人名
		#返回1到99的随机整数
		npc_n["年龄"] = randi()%99+2
		#返回1到2的随机整数
		npc_n["性别"] = randi()%2+2 #1男2女
		#返回1到99的随机整数
		npc_n["职业"] = randi()%2+2 #数字详见表
		npc_n["血量"] = randi()%200+2
		npc_n["攻击力"] = randi()%200+2
		npc_n["防御力"] = randi()%200+2
		npc_n["速度"] = randi()%200+2
		npc_n["技能"] = randi()%9+300002 #300001····
		npc_n["背包"] = randi()%25+100002 #100001····
		#打印存档玩家数据
#		print(
#			"当前NPC名：" + str(npc_n["名字"]) + 
#			"当前NPC年龄：" + str(npc_n["年龄"]) + 
#			"当前NPC性别：" + str(npc_n["性别"]) + 
#			"当前NPC血量：" + str(npc_n["血量"]) + 
#			"当前NPC攻击力：" + str(npc_n["攻击力"]) + 
#			"当前NPC防御力：" + str(npc_n["防御力"]) + 
#			"当前NPC速度：" + str(npc_n["速度"]) + 
#			"当前NPC技能：" + str(npc_n["技能"]) + 
#			"当前NPC背包：" + str(npc_n["背包"])
#			)
		数据.file.store_var(npc_n)
	print("NPC生成OK")
	#添加地图数组
	
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
	changer_scence.changer("res://资源/场景/过场/开场剧情.tscn")

#加载函数
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
#	黑屏对话.read_dialog('res://D-L-BUT-NO-C/开场黑屏.txt')
	changer_scence.changer("res://资源/场景/过场/开场剧情.tscn")
#	changer_scence.changer("res://资源/场景/UI/Loding.tscn", "Loading")
