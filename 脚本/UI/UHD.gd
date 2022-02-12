extends CanvasLayer

onready var bag = $背包
onready var 弹窗 = $弹窗
onready var 弹窗标题S = $弹窗/身体/信息/标题
onready var 弹窗内容S = $弹窗/身体/信息/内容

var 打开UHD = false
#open_bag 是 是否打开过背包
var open_bag = false

func _ready():
	bag.hide()
	弹窗.hide()
	Uhd.layer = -128

func tab():
	#判断是否打开了UHD，决定是开还是关
	if 打开UHD == false:
		print("没打开UHD")
		#没打开UHD
		#判断是否是第一次打开背包
		#是第一次打开背包
		if open_bag == false:
			print("是第一次打开背包")
			#切换打开背包状态
			open_bag = true
			#初始化并显示
			get_tree().call_group("背包", "初始化")
			#显示背包
			bag.show()
			#调整UHD层级
			Uhd.layer = 128
			#暂停游戏
			get_tree().paused = true
			#切换UHD状态
			打开UHD = true
	#不是第一次打开背包
		else:
			print("不是第一次打开背包")
			#调用显示函数
			#切换打开背包状态
			open_bag = true
			#显示背包
			bag.show()
			#调整UHD层级
			Uhd.layer = 128
			#暂停游戏
			get_tree().paused = true
			#切换UHD状态
			打开UHD = true
	#打开了UHD，是要关闭UHD
	else:
		print("打开了UHD")
		#恢复游戏状态
		get_tree().paused = false
		#隐藏背包
		bag.hide()
		#调整UHD层级
		Uhd.layer = -128
		#切换UHD打开状态
		打开UHD = false


func 弹窗():
	弹窗标题S.text = 数据.弹窗标题
	弹窗内容S.text = 数据.弹窗内容
	弹窗.popup()
	Uhd.layer = 128

func hide_go_main():
	Uhd.layer = -128
	changer_scence.changer("res://资源/场景/主界面.tscn")


# 普通对话
func dialog_normal(title: String, resource: DialogueResource) -> void:
	var dialogue = yield(DialogueManager.get_next_dialogue_line(title, resource), "completed")
	if dialogue != null:
		var balloon := preload("res://资源/对话/dialog_balloon/example_balloon.tscn").instance()
		balloon.dialogue = dialogue
		add_child(balloon)
		dialog_normal(yield(balloon, "actioned"), resource)
		
		
		
