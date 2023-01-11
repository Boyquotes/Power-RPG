extends CanvasLayer

onready var 弹窗 = $弹窗
onready var 弹窗标题S = $弹窗/身体/信息/标题
onready var 弹窗内容S = $弹窗/身体/信息/内容
onready var tab_btn = $RadialMenu
onready var anima = $AnimationPlayer
onready var toottip = $悬浮信息框
onready var tween = $Tween
# ========== UHD顶栏 ==========
onready var 金币 = $UHD顶栏/CenterContainer/Hbox/Hbox/金币/数量
onready var 金石 = $UHD顶栏/CenterContainer/Hbox/Hbox/金石/数量
onready var 织物 = $UHD顶栏/CenterContainer/Hbox/Hbox/织物/数量
onready var 木头 = $UHD顶栏/CenterContainer/Hbox/Hbox/木头/数量
onready var 草药 = $UHD顶栏/CenterContainer/Hbox/Hbox/草药/数量

var 打开UHD = false
var npc_bar = preload("res://资源/场景/UI/NPC信息框.tscn")
#open_bag 是 是否打开过背包
var open_bag = false

func _ready():
	$黑色遮罩.hide()
	$侧栏.hide()
	$NPC.hide()
	anima.play("RESET")

# block是图块资源class
func UHD顶栏更新(block):
	print(block.metals)
	金币.text = str(block.coin)
	金石.text = str(block.metals)
	织物.text = str(block.fabric)
	木头.text = str(block.wood)
	草药.text = str(block.medicinal)
	

func _input(event):
	if Input.is_action_just_pressed("esc"):
		esc()

func add_tooltip(鼠标坐标, 图块索引):
	toottip.reset()
	tween.interpolate_property(toottip, "rect_position", toottip.rect_position, 
	鼠标坐标, 0.1, Tween.TRANS_SINE, Tween.EASE_OUT)
	
	# 获取图块node，调用更新信息框函数
	get_parent().get_node("Test/TileMap").get_child(图块索引).更新信息框()
	
	toottip.popup()
	tween.start()

func die_tooltip():
	toottip.hide()
	toottip.reset()

func esc():
	#判断是否打开了UHD，决定是开还是关
	if 打开UHD == false:
		#没打开UHD
		#暂停游戏
		get_tree().paused = true
		#切换UHD状态
		打开UHD = true
		$黑色遮罩.show()
		$侧栏.show()
		anima.play("侧栏出现")
	else:
		print("关闭侧栏")
		#恢复游戏状态
		get_tree().paused = false
		#切换UHD打开状态
		打开UHD = false
		anima.play_backwards("侧栏出现")
		yield(anima, "animation_finished")
		$黑色遮罩.hide()
		$侧栏.hide()


func hide_go_main():
	Uhd.layer = -128
	changer_scence.changer("res://资源/场景/主界面.tscn")


# 普通对话
func show_dialogue(title: String, local_resource: DialogueResource = null, extra_game_states: Array = []) -> void:
	var dialogue_line = yield(DialogueManager.get_next_dialogue_line(title, local_resource, extra_game_states), "completed")
	if dialogue_line != null:
		var balloon = preload("res://资源/场景/对话/普通对话.tscn").instance()
		balloon.dialogue_line = dialogue_line
		get_tree().current_scene.add_child(balloon)
		show_dialogue(yield(balloon, "actioned"), local_resource, extra_game_states)

# npc_class 是一个数组，里面是一个个NPC Class
func show_npcs(npc_class):
	# 每次调用都删除一遍
	删除子节点(get_node("NPC"))
	if npc_class.size() == 0:
		pass
	else:
		for i in npc_class.size():
			var npc_node = npc_bar.instance()
			$NPC.add_child(npc_node)
			npc_node.update_info(npc_class[i])
		$NPC.show()
		anima.play("NPC出现")
	
func 删除子节点(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func _on_设置_pressed():
	pass # Replace with function body.
