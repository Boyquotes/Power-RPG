extends CanvasLayer

onready var NPC = $UI/NPC
onready var 侧栏 = $UI/侧栏
onready var anima = $AnimationPlayer
# ========== UHD顶栏 ==========
onready var 顶栏 = $UI/UHD顶栏
onready var 底栏 = $UI/UHD底栏
onready var 金币 = $UI/UHD顶栏/CenterContainer/Hbox/Hbox/金币/数量
onready var 金石 = $UI/UHD顶栏/CenterContainer/Hbox/Hbox/金石/数量
onready var 织物 = $UI/UHD顶栏/CenterContainer/Hbox/Hbox/织物/数量
onready var 木头 = $UI/UHD顶栏/CenterContainer/Hbox/Hbox/木头/数量
onready var 草药 = $UI/UHD顶栏/CenterContainer/Hbox/Hbox/草药/数量
# ========== Tooltip ==========
onready var 图块悬浮框 = preload("res://资源/场景/UI/悬浮信息框.tscn")
onready var tween = $Tween
onready var 物品悬浮框 = preload("res://资源/场景/UI/物品悬浮信息.tscn")

var obj : Object

var 打开UHD = false
var npc_bar = preload("res://资源/场景/UI/NPC信息框.tscn")
#open_bag 是 是否打开过背包
var open_bag = false

func _ready():
	$UI/黑色遮罩.hide()
	侧栏.hide()
	NPC.hide()
	anima.play("RESET")

# block是图块资源class
func UHD顶栏更新(block):
	金币.text = str(block.coin)
	金石.text = str(block.metals)
	织物.text = str(block.fabric)
	木头.text = str(block.wood)
	草药.text = str(block.medicinal)

func _input(event):
	if Input.is_action_just_pressed("esc"):
		esc()

# ============= 物品 Tooltip ==============
func 物品悬浮(mouse_pos:Vector2, item_info:Array):
#	物品悬浮框.rect_position = mouse_pos
	var pos2 = Vector2(mouse_pos.x + 10, mouse_pos.y + 10)
	var 物品悬浮框_ = 物品悬浮框.instance()
	
	if pos2.x + 物品悬浮框_.rect_size.x > OS.get_screen_size().x:
		pos2.x = pos2.x - 物品悬浮框_.rect_size.x
		
	if pos2.y + 物品悬浮框_.rect_size.y > OS.get_screen_size().y:
		pos2.y = pos2.y - 物品悬浮框_.rect_size.y + 50
		
	add_child(物品悬浮框_)
	物品悬浮框_.rect_position = pos2
	物品悬浮框_.update_info(item_info)
	obj = 物品悬浮框_

func 物品悬浮离开():
	if obj != null:
		obj.queue_free()
		obj = null
	else:
		pass
# =========================================


# ============= 图块Tooltip ============
func add_tooltip(鼠标坐标:Vector2, 图块索引:int):
	var 图块悬浮框_ = 图块悬浮框.instance()
	var pos2 = Vector2(鼠标坐标.x + 10, 鼠标坐标.y + 10)
	obj = 图块悬浮框_
	if pos2.x + 图块悬浮框_.rect_size.x > OS.get_screen_size().x:
		pos2.x = pos2.x - 图块悬浮框_.rect_size.x
	if pos2.y + 图块悬浮框_.rect_size.y > OS.get_screen_size().y:
		pos2.y = pos2.y - 图块悬浮框_.rect_size.y + 50
	add_child(图块悬浮框_)
	图块悬浮框_.rect_position = pos2
	get_parent().get_node("Test/TileMap").get_child(图块索引).更新信息框()

func die_tooltip():
	if obj != null:
		obj.queue_free()
		obj = null
	else:
		pass
# =====================================

func esc():
	if 打开UHD == false:
		get_tree().paused = true
		#切换UHD状态
		打开UHD = true
		$UI/黑色遮罩.show()
		侧栏.show()
		anima.play("侧栏出现")
	else:
		#恢复游戏状态
		get_tree().paused = false
		#切换UHD打开状态
		打开UHD = false
		anima.play_backwards("侧栏出现")
		yield(anima, "animation_finished")
		$UI/黑色遮罩.hide()
		侧栏.hide()

func hide_go_main():
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
	删除子节点(NPC)
	if npc_class.size() == 0:
		pass
	else:
		for i in npc_class.size():
			var npc_node = npc_bar.instance()
			NPC.add_child(npc_node)
			npc_node.update_info(npc_class[i])
		NPC.show()
		anima.play("NPC出现")
	
func 删除子节点(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func _on_设置_pressed():
	pass # Replace with function body.
