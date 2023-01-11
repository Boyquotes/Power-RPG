extends Node2D

var block
var map_name_text
var event_id
var npcs_id
var 信息数组 = []
var 事件数组 = []
var NPC数组 = []
var save_ : bool
var key
var random = RandomNumberGenerator.new()
# 所有NPC
var 所有NPC = []

# NPC 与 事件数量
var npc_num
var event_num

onready var map_name_list = 数据.Map_name_data[500001]

func _init():
	mmkv.initMMKV("厉害RPG", "save.default")

# now_npc_id是一个ID数组，因为是在ready时调用，有可能没有NPC
# 添加NPC Class
func add_npc_class(now_npc_id):
	if str(now_npc_id[0]) == "没有NPC":
		pass
	else:
		for i in now_npc_id.size():
			# new一个npcs的class，这个class就是npc单位
			var now_npc = 数据.npcs.new()
			random.randomize()
			now_npc.name = 数据.Npc_name_data[now_npc_id[i]]
			now_npc.age = random.randi_range(0, 99)
			# 0:男 1:女
			now_npc.gender = random.randi_range(0, 1)
			# [脸型，头发，眼睛，眉毛，嘴巴，鼻子,衣服]
			random.randomize()
			now_npc.portrait = [random.randi_range(1, 7),
			random.randi_range(1, 5),
			random.randi_range(1, 4),
			random.randi_range(1, 5),
			random.randi_range(1, 5),
			random.randi_range(1, 5),
			random.randi_range(1, 4)
			]
			
			所有NPC.append(now_npc)

func launch():
	
	pass

func add_key():
	数据.num = 0
	数据.born_key()
	key = 数据.key_list[数据.num]
	数据.num += 1
	return key

func save():
	key = add_key()
	
	var block_dic = {
		"npcs": NPC数组,
		"event": 事件数组,
		"info": 信息数组,
		}
	#    存数组       key           值
	mmkv.setDict(str(key), block_dic)

# 读取存档
func load_save():
	# 清除数组
	信息数组.clear()
	NPC数组.clear()
	事件数组.clear()
	# 重新给数组赋值
	事件数组 = mmkv.getDict(str(key)).event
	信息数组 = mmkv.getDict(str(key)).info
	NPC数组 = mmkv.getDict(str(key)).npcs
	

func _ready():
	# 随机数
	random.randomize()
	# 实例化新图块
	block = 数据.map_block.new()
	# 添加地名
	var number = random.randi_range(500001, 500864)
	map_name_text = 数据.Map_name_data[number].地名
	block.name = map_name_text
	# 添加事件
	add_event()
	# 添加NPC
	add_npc()

	# 设定block（Class）值
	block.npcs = NPC数组
	block.event = 事件数组
	block.type = random.randi_range(0, 15)
	block.wood = random.randi_range(0, 1000)
	block.food = random.randi_range(0, 1000)
	block.metals = random.randi_range(0, 1000)
	block.medicinal = random.randi_range(0, 1000)
	block.fabric = random.randi_range(0, 1000)
	block.coin = random.randi_range(0, 1000)
	block.time = random.randi_range(1, 5)

	#顺序：名称 木材 食物 药材 金石 织物 金币 时间 类型
	信息数组.append(block.name)
	信息数组.append(block.wood)
	信息数组.append(block.food)
	信息数组.append(block.medicinal)
	信息数组.append(block.metals)
	信息数组.append(block.fabric)
	信息数组.append(block.coin)
	信息数组.append(block.time)
	信息数组.append(block.type)
	
	# 以类型设置图块
	$Sprite.frame = block.type
	# 添加NPC Class
	add_npc_class(NPC数组)
	launch()

func add_npc():
	NPC数组.clear()
	npc_num = random.randi_range(0, 1)
	# 决定有没有NPC
	if npc_num == 0: # 没有NPC
		NPC数组.append("没有NPC")
	else: # 有NPC
		# 决定有多少NPC
		npc_num = random.randi_range(1, 4)
		# 循环添加NPC
		for i in npc_num:
			# 取NPC的ID
			var number3 = random.randi_range(600001, 601123)
			npcs_id = 数据.Npc_name_data[number3].id

			NPC数组.append(npcs_id)

func add_event():
	事件数组.clear()
	event_num = random.randi_range(0, 1)
	# 决定有没有事件
	if event_num == 0: # 没有事件
		事件数组.append("没有事件")
	else: # 有事件
		# 决定有多少事件
		event_num = random.randi_range(1, 4)
		# 循环添加事件
		for i in event_num:
			# 取事件的ID
			var number3 = random.randi_range(900001, 900184)
			event_id = 数据.Event_data[number3].id
			事件数组.append(event_id)

# 当悬浮，更新信息
func 更新信息框():
	get_tree().call_group("信息框", "更新", 信息数组, 事件数组, NPC数组)
	

# 鼠标离开
func _on_格子模板_mouse_exited():
#	Uhd.die_tooltip()
	pass

# 鼠标进入
func _on_格子模板_mouse_entered():
	# 获取鼠标坐标
	var mouse_pos = get_viewport().get_mouse_position()
	var 图块索引 = self.get_index()
	# 添加 Tooltip
	Uhd.add_tooltip(mouse_pos, 图块索引)


func _on_格子模板_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("mouse_left"):
		# 所有NPC是一个数组，里面是一个个NPC Class
		Uhd.show_npcs(所有NPC)
		
